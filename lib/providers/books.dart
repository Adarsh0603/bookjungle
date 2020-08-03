import 'dart:convert';
import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum PaginatorCall {
  byTitle,
  byArgs,
}

class Books extends ChangeNotifier {
  List<Book> _searchedBooksList = [];
  final _singleLoadBookCount = 18;
  int startIndex = 0;
  String _searchedBook = '';
  Map _searchedArgs = {};
  int totalItems;
  bool _isLoading = false;
  bool _reachedEnd = false;
  bool _firstLoad = true;

  PaginatorCall calledBy;
  void setLoading(bool loadingState) {
    _isLoading = loadingState;
    notifyListeners();
  }

  bool get firstLoad {
    return _firstLoad;
  }

  void toggleTotalItemsCalculation(bool toggle) {
    _firstLoad = toggle;
//    notifyListeners();
  }

  List<Book> get getBooksList {
    return [..._searchedBooksList];
  }

  bool get isLoading {
    return _isLoading;
//    notifyListeners();
  }

  int get totalBookCount {
    return totalItems;
  }

  void setStartIndex() {
    startIndex = 0;
//    notifyListeners();
  }

  bool get reachedEnd {
    return _reachedEnd;
  }

  Future<void> getSearchedBookData(String bookName) async {
    calledBy = PaginatorCall.byTitle;
    _searchedBooksList.clear();
    notifyListeners();
    _searchedBook = bookName;
    var url =
        'https://www.googleapis.com/books/v1/volumes?q=intitle:$bookName&maxResults=$_singleLoadBookCount&startIndex=$startIndex';

    try {
      _reachedEnd = false;
      setLoading(true);
      http.Response response = await http.get(url);
      setLoading(false);
      var jsonResponse = await jsonDecode(response.body);
      if (_firstLoad) totalItems = jsonResponse['totalItems'];

      List searchedBooksJson = jsonResponse['items'];
      if (searchedBooksJson == null) {
        _reachedEnd = true;
        return;
      }
      List<Book> searchedBooks = [];
      searchedBooksJson.forEach((book) {
        searchedBooks.add(Utils.bookFromJson(book));
      });
      _searchedBooksList = searchedBooks;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getSearchedBookByArgs(Map searchArgs) async {
    calledBy = PaginatorCall.byArgs;
    _searchedArgs = searchArgs;
    _searchedBooksList.clear();
    var url;
    if (searchArgs.containsKey('bookTitle') &&
        searchArgs.containsKey('bookAuthor')) {
      url =
          'https://www.googleapis.com/books/v1/volumes?q=intitle:${searchArgs['bookTitle']}+inauthor:${searchArgs['bookAuthor']}&orderBy=newest&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    try {
      _reachedEnd = false;
      http.Response response = await http.get(url);
      var jsonResponse = await jsonDecode(response.body);
      if (_firstLoad) totalItems = jsonResponse['totalItems'];

      List searchedBooksJson = jsonResponse['items'];
      if (searchedBooksJson == null) {
        _reachedEnd = true;
        return;
      }
      List<Book> searchedBooks = [];
      searchedBooksJson.forEach((book) {
        searchedBooks.add(Utils.bookFromJson(book));
      });
      _searchedBooksList = searchedBooks;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void paginate(bool foreword) {
    foreword
        ? startIndex += _singleLoadBookCount
        : startIndex >= _singleLoadBookCount
            ? startIndex -= _singleLoadBookCount
            : startIndex = _singleLoadBookCount;
    calledBy == PaginatorCall.byTitle
        ? getSearchedBookData(_searchedBook)
        : getSearchedBookByArgs(_searchedArgs);
  }

  Book getBookById(String id) {
    return _searchedBooksList.firstWhere((element) => (element.id == id));
  }
}
