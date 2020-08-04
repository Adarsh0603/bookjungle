import 'package:books_app/constants.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 75.0, right: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(SpecificSearchScreen.routeName, arguments: {
            'category': category.categoryLink,
            'categoryTitle': category.categoryTitle,
          });
        },
        child: Card(
          shape: kRoundedCornersShape,
          elevation: 18,
          child: Container(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 36,
                  height: 36,
                  child: Image.asset(
                    category.iconLink,
                    scale: 1.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  category.categoryTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
