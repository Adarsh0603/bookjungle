import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/book_overview_item.dart';
import 'package:books_app/widgets/paginator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Consumer<Books>(
          builder: (BuildContext context, books, _) => Column(
            children: <Widget>[
              books.getBooksList.length == 00
                  ? Expanded(child: Center(child: CircularProgressIndicator()))
                  : books.reachedEnd
                      ? Expanded(child: Center(child: Text('No More Books')))
                      : Expanded(
                          child: Container(
//                      height: MediaQuery.of(context).size.height * 0.6,
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 16.0),
                            child: GridView.builder(
                                itemCount: books.getBooksList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                        childAspectRatio: 2 / 3),
                                itemBuilder: (context, i) {
                                  return BookOverviewItem(
                                      books.getBooksList[i].id);
                                }),
                          ),
                        ),
              if (!books.firstLoad)
                Paginator(),

              //this is a category branch comment
            ],
          ),
        ),
      ),
    );
  }
}
