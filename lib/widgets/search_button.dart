import 'package:books_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding:
            EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12.0, left: 20.0),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                topLeft: Radius.circular(40.0))),
        child: Hero(
          tag: 'searchIcon',
          child: Icon(
            Icons.search,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(SearchScreen.routeName);
      },
    );
  }
}
