import 'package:books_app/constants.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BestSellerCategoryItem extends StatelessWidget {
  final Category category;

  BestSellerCategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
        child: Material(
          elevation: 1,
          shadowColor: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    category.categoryTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Books Between\n${category.oldDate.substring(0, 4)} - ${category.newDate.substring(0, 4)}',
                        style: TextStyle(fontSize: 12, color: kLightColor),
                      ),
                      Text(
                        'Updated\n${category.updated}',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12, color: kLightColor),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
