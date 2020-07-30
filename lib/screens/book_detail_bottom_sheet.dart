import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/detailWidgets/book_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final String bookId;

  BookDetailBottomSheet(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context).getBookById(bookId);
    return Container(
      color: Color(0xFF737373).withOpacity(0),
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: (kBookImageHeight / 2) + 40, left: 16.0, right: 16.0),
              child: BookDetailsWidget(book),
            ),
          ),
          Positioned(
            top: -kBookImageHeight / 2,
            child: Card(
              elevation: 10.0,
              shape: kSearchBarShape,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  book.thumbnailUrl,
                  height: kBookImageHeight,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 40,
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print(book.infoLink);
                Share.share('Check out this book book ${book.infoLink}');
              },
            ),
          ),
          Positioned(
            right: 20,
            top: 80,
            child: IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text('ADDED TO BOOKSHELF'),
                ));
              },
            ),
          ),
          Positioned(
            right: 20,
            top: -(kBookImageHeight / 2),
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
