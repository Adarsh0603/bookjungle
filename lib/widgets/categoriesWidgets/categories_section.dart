import 'package:books_app/providers/categories.dart';
import 'package:books_app/widgets/categoriesWidgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 8.0),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: MediaQuery.of(context).size.height * 0.2,
                itemCount: categories.categoriesList.length,
                itemBuilder: (context, i) =>
                    CategoryItem(categories.categoriesList[i])),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
