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
          elevation: 01.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${books.totalBookCount} books found',
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                IconButton(
                  color: kPrimaryColor,
                  icon: Icon(Icons.chevron_left),
                  onPressed: books.startIndex == 0
                      ? null
                      : () {
                          books.paginate(false);
                          books.setSpecificScreenLoadingState(true);
                        },
                ),
                IconButton(
                  color: kPrimaryColor,
                  icon: Icon(Icons.chevron_right),
//          !books.reachedEnd &&
                  onPressed: (books.startIndex <= books.totalBookCount - 18)
                      ? () {
                          books.paginate(true);
                          books.setSpecificScreenLoadingState(true);
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
