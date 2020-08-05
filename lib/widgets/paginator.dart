import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Paginator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Books>(
      builder: (BuildContext context, books, _) {
        return Card(
          elevation: 8.0,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 16.0, right: 16.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${books.totalBookCount} books found',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.chevron_left),
                  onPressed: books.startIndex == 0
                      ? null
                      : () {
                          books.paginate(false);
                          print(books.startIndex);
                        },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.chevron_right),
//          !books.reachedEnd &&
                  onPressed: (books.startIndex <= books.totalBookCount - 18)
                      ? () {
                          books.paginate(true);
                        }
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
