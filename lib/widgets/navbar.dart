import 'dart:math';

import 'package:books_app/constants.dart';
import 'package:books_app/screens/bookshelf_screen.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:books_app/screens/search_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String currentRoute;

  NavBar(this.currentRoute);

  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.09, 60.0);
    final width = min(MediaQuery.of(context).size.width * 0.5, 200.0);
    return Container(
      height: height,
      width: width,
      child: Card(
        shape: kSearchBarShape,
        color: kPrimaryColor,
        elevation: 18,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            NavbarButton(Icons.collections_bookmark, BookShelfScreen.routeName,
                currentRoute),
            NavbarButton(Icons.home, HomeScreen.routeName, currentRoute),
            NavbarButton(Icons.search, SearchScreen.routeName, currentRoute),
          ],
        ),
      ),
    );
  }
}

class NavbarButton extends StatefulWidget {
  final IconData icon;
  final String route;
  final String currentRoute;

  NavbarButton(this.icon, this.route, this.currentRoute);

  @override
  _NavbarButtonState createState() => _NavbarButtonState();
}

class _NavbarButtonState extends State<NavbarButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(widget.icon),
      color: Colors.white,
      onPressed: () {
        if (widget.currentRoute == widget.route) return;
        Navigator.of(context).pushReplacementNamed(widget.route);
      },
    );
  }
}
