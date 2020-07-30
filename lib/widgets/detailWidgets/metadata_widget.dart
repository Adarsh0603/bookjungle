import 'package:books_app/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MetadataWidget extends StatelessWidget {
  final Book book;

  MetadataWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Publisher',
                style: TextStyle(color: kLightColor),
              ),
              Text(
                Utils.trimString(book.publisher, 20),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
                softWrap: true,
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Pages',
                style: TextStyle(color: kLightColor),
              ),
              Text(
                book.pageCount == null ? '---' : book.pageCount.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Rating',
                textAlign: TextAlign.center,
                style: TextStyle(color: kLightColor),
              ),
              Text(
                book.averageRating,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Published',
                textAlign: TextAlign.center,
                style: TextStyle(color: kLightColor),
              ),
              Text(
                book.publishedDate,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
