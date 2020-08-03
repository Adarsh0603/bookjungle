import 'package:books_app/models/savedBook.dart';
import 'package:books_app/services/db_helper.dart';
import 'package:flutter/cupertino.dart';

class Bookshelf with ChangeNotifier {
  List<SavedBook> _savedBooks = [];

  List<SavedBook> get savedBooks {
    return [..._savedBooks];
  }

  void addToBookShelf(
      String bookId, String bookTitle, String bookImageUrl, String authors) {
    final bookToSave = SavedBook(
        id: bookId, title: bookTitle, imageUrl: bookImageUrl, authors: authors);
    _savedBooks.add(bookToSave);
    notifyListeners();

    DBHelper.insert('bookshelf', {
      'bookId': bookToSave.id,
      'bookTitle': bookToSave.title,
      'authors': bookToSave.authors,
      'bookImageUrl': bookToSave.imageUrl,
    });
  }

  Future<void> fetchAndSetBooks() async {
    await DBHelper.database();
    final savedBooksList = await DBHelper.getData('bookshelf');
    _savedBooks = savedBooksList
        .map((item) => SavedBook(
            id: item['bookId'],
            title: item['bookTitle'],
            authors: item['authors'],
            imageUrl: item['bookImageUrl']))
        .toList();
  }

  Future<void> removeSavedBook(String id) async {
    await DBHelper.deleteBook(id);
    fetchAndSetBooks();
  }

  Future<bool> checkExistingBook(String id) async {
    return await DBHelper.findBook(id);
  }
}
