import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/books_grid.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loadGrid = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Books>(context, listen: false).clearList();
      setState(() {
        loadGrid = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
            if (loadGrid)
              BooksGrid(
                routeName: SearchScreen.routeName,
              ),
          ],
        ),
      ),
    );
  }
}
