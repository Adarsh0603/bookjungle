import 'dart:math';

import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/bookshelf_screen.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:books_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String currentRoute;

  NavBar(this.currentRoute);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool openNav = false;

  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.09, 60.0);
    final width = min(
        openNav
            ? MediaQuery.of(context).size.width * 0.6
            : MediaQuery.of(context).size.width * 0.2,
        200.0);
    return Container(
      height: height,
      width: width,
      child: Row(
        children: <Widget>[
          Card(
            shape: kSearchBarShape,
            color: Colors.white,
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (openNav)
                  NavbarButton(Icons.bookmark, BookShelfScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton(
                      Icons.home, HomeScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton(Icons.search, SearchScreen.routeName,
                      widget.currentRoute),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 48,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  child: Icon(
                    openNav ? Icons.chevron_right : Icons.chevron_left,
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      openNav = !openNav;
                    });
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  final IconData icon;
  final String route;
  final String currentRoute;

  NavbarButton(this.icon, this.route, this.currentRoute);

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context, listen: false);
    return IconButton(
      icon: Icon(icon),
      color: kPrimaryColor,
      onPressed: () {
        if (currentRoute == route) return;
        Navigator.of(context).pushReplacementNamed(route);
        books.setFirstLoad(true);
      },
    );
  }
}
