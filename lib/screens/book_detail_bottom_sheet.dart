import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final String bookId;

  BookDetailBottomSheet(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context).getBookById(bookId);
    return Container(
      color: Color(0xFF737373).withOpacity(0),
      child: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
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
        ],
      ),
    );
  }
}
