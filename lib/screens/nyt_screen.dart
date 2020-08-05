import 'package:books_app/constants.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/categoriesWidgets/bestseller_category_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NYTScreen extends StatelessWidget {
  static const routeName = '/nyt-screen';

  @override
  Widget build(BuildContext context) {
    final nyt = Provider.of<NYT>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  elevation: 1,
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.only(top: 24, left: 16, bottom: 26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            child: Icon(Icons.arrow_back),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'New York Times',
                                style:
                                    TextStyle(fontSize: 12, color: kLightColor),
                              ),
                              Text(
                                'Bestsellers',
                                style: TextStyle(
                                    fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                    child: ListView.builder(
                        itemCount: nyt.getAllCategories.length,
                        itemBuilder: (ctx, i) =>
                            BestSellerCategoryCard(nyt.getAllCategories[i]))),
              ],
            ),
          ),
        ));
  }
}
