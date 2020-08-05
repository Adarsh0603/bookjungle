import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/categoriesWidgets/bestseller_category_item.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NYTScreen extends StatelessWidget {
  static const routeName = '/nyt-screen';

  @override
  Widget build(BuildContext context) {
    final nyt = Provider.of<NYT>(context);
    return Scaffold(
//        backgroundColor: Colors.grey[100],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: NavBar(NYTScreen.routeName),
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16, left: 16, bottom: 16.0),
                  child: Text(
                    'bestseller categories',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: nyt.getAllCategories.length,
                        itemBuilder: (ctx, i) =>
                            BestSellerCategoryItem(nyt.getAllCategories[i]))),
              ],
            ),
          ),
        ));
  }
}
