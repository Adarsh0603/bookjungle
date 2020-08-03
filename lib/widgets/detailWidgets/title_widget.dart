import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
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
            Utils.trimString(book.title, 40),
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          if (book.subtitle != null)
            Text(
              Utils.trimString(book.subtitle, 40),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0),
            ),
        ],
      ),
    );
  }
}
