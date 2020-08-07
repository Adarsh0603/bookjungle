import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/search_screen.dart';
import 'package:books_app/widgets/book_overview_item.dart';
import 'package:books_app/widgets/network_sensititve.dart';
import 'package:books_app/widgets/paginator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BooksGrid extends StatelessWidget {
  final String routeName;
  BooksGrid({this.routeName});

  @override
  Widget build(BuildContext context) {
    bool loading;

    return Expanded(
      child: NetworkSensitive(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Consumer<Books>(builder: (BuildContext context, books, _) {
            if (routeName != SearchScreen.routeName) {
              loading = books.specificScreenLoadingState;
            } else
              loading = books.isLoading;
            return Column(
              children: <Widget>[
                if (!books.firstLoad)
                  Padding(
                      padding:
                          EdgeInsets.only(bottom: 4, left: 16, right: 16.0),
                      child: Paginator()),
                loading
                    ? Expanded(
                        child: Center(child: CircularProgressIndicator()))
                    : books.reachedEnd
                        ? Expanded(
                            child: Center(
                                child: Text(
                            'Nothing Here.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )))
                        : Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 16.0),
                              child: GridView.builder(
                                  itemCount: books.getBooksList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 5.0,
                                          crossAxisSpacing: 2.0,
                                          childAspectRatio: 2 / 3),
                                  itemBuilder: (context, i) {
                                    return BookOverviewItem(
                                        books.getBooksList[i].id);
                                  }),
                            ),
                          ),
              ],
            );
          }),
        ),
        offlineChild: Center(
          child: Image.asset('images/nointernet.png'),
        ),
      ),
    );
  }
}
