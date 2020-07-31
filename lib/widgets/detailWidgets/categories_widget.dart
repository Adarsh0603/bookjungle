import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final Book book;

  CategoriesWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(3.0),
        color: Color(0xffD6EFE8),
        child: Text(
          Utils.listToString(book.categories, '   '),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xff50AE90),
              fontSize: 12.0,
              fontWeight: FontWeight.w500),
          softWrap: true,
        ),
      ),
    );
  }
}
