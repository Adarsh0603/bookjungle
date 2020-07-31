import 'dart:convert';
import 'package:books_app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Books extends ChangeNotifier {
  List<Book> _searchedBooksList = [];

  List<Book> get getBooksList {
    return [..._searchedBooksList];
  }

  Future<void> getSearchedBookData(String bookName) async {
    clearPreviousList();
    final url = 'https://www.googleapis.com/books/v1/volumes?q=$bookName';
    try {
      http.Response response = await http.get(url);
      var jsonResponse = await jsonDecode(response.body);
      List searchedBooks = jsonResponse['items'];
      searchedBooks.forEach((book) {
        var volumeInfo = book['volumeInfo'];
        var saleInfo = book['saleInfo'];
        var accessInfo = book['accessInfo'];
        _searchedBooksList.add(
          Book(
            id: book['id'],
            title: volumeInfo['title'],
            subtitle: volumeInfo['subtitle'],
            publishedDate: volumeInfo['publishedDate'] == null
                ? '---'
                : volumeInfo['publishedDate'],
            authors: (volumeInfo['authors'] as List<dynamic>)
                .map((author) => author.toString())
                .toList(),
            publisher: volumeInfo['publisher'] == null
                ? '---'
                : volumeInfo['publisher'],
            description:
                volumeInfo['description'] ?? 'No description available.',
            pageCount: volumeInfo['pageCount'],
            categories: volumeInfo['categories'] == null
                ? []
                : (volumeInfo['categories'] as List<dynamic>)
                    .map((category) => category.toString())
                    .toList(),
            averageRating: volumeInfo['averageRating'] == null
                ? '---'
                : volumeInfo['averageRating'].toString(),
            thumbnailUrl: volumeInfo['imageLinks']['thumbnail'],
            previewLink: volumeInfo['previewLink'],
            infoLink: volumeInfo['infoLink'],
            buyLink: saleInfo['buyLink'],
            webReaderLink: accessInfo['webReaderLink'],
            isEbook: saleInfo['isEbook'],
            saleability: saleInfo['saleability'],
            amount: saleInfo['saleability'] != 'FOR_SALE'
                ? '---'
                : saleInfo['retailPrice']['amount'].toString(),
            currencyCode: saleInfo['saleability'] != 'FOR_SALE'
                ? '---'
                : saleInfo['retailPrice']['currencyCode'],
            accessViewStatus: accessInfo['accessViewStatus'],
          ),
        );
      });
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  Book getBookById(String id) {
    return _searchedBooksList.firstWhere((element) => (element.id == id));
  }

  void clearPreviousList() {
    _searchedBooksList.clear();
    notifyListeners();
  }
}
