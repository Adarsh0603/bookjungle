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
  String _searchedString = '';
  Map _searchedArgs = {};
  int totalItems;
  bool _isLoading = false;
  bool _reachedEnd = false;
  bool _firstLoad = true;
  bool _byTitleNotAuthor;
  bool _free;
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
  }

  List<Book> get getBooksList {
    return [..._searchedBooksList];
  }

  bool get isLoading {
    return _isLoading;
  }

  int get totalBookCount {
    return totalItems;
  }

  void setStartIndex() {
    startIndex = 0;
  }

  bool get reachedEnd {
    return _reachedEnd;
  }

  void setFirstLoad(bool value) {
    _firstLoad = value;
    notifyListeners();
  }

  bool _specificScreenLoadingState = false;
  void setSpecificScreenLoadingState(bool value) {
    _specificScreenLoadingState = value;
    notifyListeners();
  }

  bool get specificScreenLoadingState => _specificScreenLoadingState;

  Future<void> getSearchedBookData(
      String searchString, bool byTitleNotAuthor, bool free) async {
    calledBy = PaginatorCall.byTitle;
    _byTitleNotAuthor = byTitleNotAuthor;
    _free = free;
    _searchedBooksList.clear();
    _searchedString = searchString;
    var url = !_free
        ? 'https://www.googleapis.com/books/v1/volumes?q=${byTitleNotAuthor ? 'intitle' : 'inauthor'}:$searchString&maxResults=$_singleLoadBookCount&startIndex=$startIndex'
        : 'https://www.googleapis.com/books/v1/volumes?q=${byTitleNotAuthor ? 'intitle' : 'inauthor'}:$searchString&filter=free-ebooks&maxResults=$_singleLoadBookCount&startIndex=$startIndex';

    try {
      _reachedEnd = false;
      setLoading(true);
      http.Response response = await http.get(url);
      setLoading(false);
      var jsonResponse = await jsonDecode(response.body);
      if (_firstLoad) {
        totalItems = jsonResponse['totalItems'];
        setFirstLoad(false);
      }

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
    if (searchArgs.containsKey('category')) {
      url =
          'https://www.googleapis.com/books/v1/volumes?q=subject:${searchArgs['category']}&orderBy=newest&maxResults=$_singleLoadBookCount&startIndex=$startIndex';
    }
    try {
      _reachedEnd = false;
      http.Response response = await http.get(url);
      var jsonResponse = await jsonDecode(response.body);
      setSpecificScreenLoadingState(false);
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
        ? getSearchedBookData(_searchedString, _byTitleNotAuthor, _free)
        : getSearchedBookByArgs(_searchedArgs);
  }

  Book getBookById(String id) {
    return _searchedBooksList.firstWhere((element) => (element.id == id));
  }

  void clearList() {
    _searchedBooksList.clear();
    notifyListeners();
  }
}
