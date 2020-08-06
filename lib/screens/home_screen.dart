import 'dart:async';

import 'package:books_app/constants.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/categoriesWidgets/categories_section.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<NYT>(context, listen: false).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
      body: SafeArea(
        child: RefreshIndicator(
          color: kPrimaryColor,
          backgroundColor: Colors.white,
          displacement: 80,
          onRefresh: () async {
            await getBooksData();
          },
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //TODO:AppTitle Here
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Text(
                      'bookJungle',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                  SizedBox(height: 0.0),
                  Showcase(),
                  CategoriesSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
