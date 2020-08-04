import 'package:books_app/widgets/navbar.dart';
import 'package:flutter/material.dart';

class NYTScreen extends StatelessWidget {
  static const routeName = '/nyt-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(NYTScreen.routeName),
      appBar: AppBar(
        title: Text('Bestsellers List'),
      ),
    );
  }
}
