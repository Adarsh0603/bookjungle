import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/categoriesWidgets/categories_section.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    if (!Provider.of<NYT>(context, listen: false).isLoaded) {
      await Provider.of<NYT>(context, listen: false).getCategoryList();
      Provider.of<NYT>(context, listen: false).setLoading(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
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
                  //TODO: App Title Here
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
