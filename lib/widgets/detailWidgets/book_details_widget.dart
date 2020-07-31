import 'package:books_app/models/book.dart';
import 'package:books_app/widgets/detailWidgets/actions_widget.dart';
import 'package:books_app/widgets/detailWidgets/authors_widget.dart';
import 'package:books_app/widgets/detailWidgets/categories_widget.dart';
import 'package:books_app/widgets/detailWidgets/description_widget.dart';
import 'package:books_app/widgets/detailWidgets/metadata_widget.dart';
import 'package:books_app/widgets/detailWidgets/title_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsWidget extends StatelessWidget {
  final Book book;

  BookDetailsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CategoriesWidget(book),
        SizedBox(height: 10.0),
        AuthorsWidget(book),
        SizedBox(height: 10.0),
        TitleWidget(book),
        Divider(),
        DescriptionWidget(book),
        SizedBox(height: 10.0),
        Divider(),
        SizedBox(height: 10.0),
        MetadataWidget(book),
        SizedBox(height: 10.0),
        Divider(),
        ActionsWidget(book),
        SizedBox(height: 10.0),
      ],
    );
  }
}
