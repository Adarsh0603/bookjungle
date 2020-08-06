import 'package:books_app/constants.dart';
import 'package:books_app/models/savedBook.dart';
import 'package:books_app/providers/bookshelf.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/services/book_search_utils.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedBookItem extends StatelessWidget {
  final SavedBook savedBook;

  SavedBookItem(this.savedBook);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final searchedBook = await BookSearchUtils.fetchBookById(savedBook.id);
        showModalBottomSheet(
            elevation: 18.0,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return FutureBuilder(
                future: BookSearchUtils.fetchBookById(savedBook.id),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? BookDetailBottomSheet(searchedBook)
                      : LinearProgressIndicator();
                },
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: Dismissible(
          key: ValueKey(savedBook.id),
          background: Container(
            alignment: AlignmentDirectional.centerEnd,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.black,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) async {
            await Provider.of<Bookshelf>(context, listen: false)
                .removeSavedBook(savedBook.id);
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[200]))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.height * 0.11,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Card(
                          elevation: 8,
                          shape: kRoundedCornersShape,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            child: Image.network(
                              savedBook.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ))),
                  SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            savedBook.authors,
                            style: TextStyle(color: kLightColor, fontSize: 10),
                          ),
                          SizedBox(height: 4),
                          Text(
                            Utils.trimString(savedBook.title, 50),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
