import 'package:books_app/models/book.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final Book book;

  TitleWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            book.title,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          if (book.subtitle != null)
            Text(
              book.subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            ),
        ],
      ),
    );
  }
}
