import 'package:books_app/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/material.dart';

class AuthorsWidget extends StatelessWidget {
  final Book book;

  AuthorsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Utils.listToString(book.authors, '   '),
        textAlign: TextAlign.center,
        style: TextStyle(color: kLightColor, fontSize: 12.0),
        softWrap: true,
      ),
    );
  }
}
