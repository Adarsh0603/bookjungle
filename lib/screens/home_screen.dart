import 'package:books_app/providers/nyt.dart';
import 'package:books_app/screens/bookshelf_screen.dart';
import 'package:books_app/widgets/categoriesWidgets/categories_section.dart';
import 'package:books_app/widgets/search_button.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
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
      body: RefreshIndicator(
        onRefresh: () async {
          await getBooksData();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.collections_bookmark,
                      color: Colors.green,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(BookShelfScreen.routeName);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SearchButton(),
                ],
              ),
              SizedBox(height: 10.0),
              Showcase(),
              CategoriesSection(),
            ],
          ),
        ),
      ),
    );
  }
}
