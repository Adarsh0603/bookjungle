import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/book_detail_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookOverviewItem extends StatelessWidget {
  final String bookId;

  BookOverviewItem(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context).getBookById(bookId);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            barrierColor: kBarrierColor,
            context: context,
            builder: (context) {
              return BookDetailBottomSheet(bookId);
            });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 8,
            child: Card(
              elevation: 4.0,
              child: Image.network(
                book.thumbnailUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Expanded(
              child: Text(
            book.title,
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
