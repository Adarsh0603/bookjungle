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
    return Card(
      shape: kSearchBarShape,
      color: kPrimaryColor,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            NavbarButton(Icons.category, NYTScreen.routeName, currentRoute),
//            Container(height: 20, width: 30, child: VerticalDivider()),
            NavbarButton(Icons.collections_bookmark, BookShelfScreen.routeName,
                currentRoute),

            Container(height: 20, width: 30, child: VerticalDivider()),
            NavbarButton(Icons.home, HomeScreen.routeName, currentRoute),
            Container(height: 20, width: 30, child: VerticalDivider()),
            NavbarButton(Icons.search, SearchScreen.routeName, currentRoute),
          ],
        ),
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
    return GestureDetector(
      child: Icon(
        icon,
        color: Colors.white,
        size: 25,
      ),
      onTap: () {
        if (currentRoute == route) return;
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }
}
