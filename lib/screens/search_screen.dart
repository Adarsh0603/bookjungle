import 'package:books_app/constants.dart';
import 'package:books_app/widgets/books_grid.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(SearchScreen.routeName),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Discover',
                    style: kSearchScreenHeaderStyle,
                  ),
                  SizedBox(height: 10),
                  SearchBar(),
                ],
              ),
            ),
            BooksGrid(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
