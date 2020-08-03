import 'package:flutter/cupertino.dart';

class SavedBook {
  final String id;
  final String title;
  final String authors;
  final String imageUrl;

  SavedBook(
      {@required this.id,
      @required this.title,
      @required this.authors,
      @required this.imageUrl});
}
