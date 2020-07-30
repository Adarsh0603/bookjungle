import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/book_overview_item.dart';
import 'package:books_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Discover',
                style: kSearchScreenHeaderStyle,
              ),
              SearchBar(),
              Expanded(
                child: Consumer<Books>(
                  builder: (BuildContext context, books, _) => GridView.builder(
                      itemCount: books.getBooksList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 9 / 16),
                      itemBuilder: (context, i) {
                        return BookOverviewItem(books.getBooksList[i].id);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
