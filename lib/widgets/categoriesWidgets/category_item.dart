import 'package:books_app/constants.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final Category category;

  CategoryItem(this.category);

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  double elevation = 18.0;

  void navigateToSpecificSearchScreen() {
    setState(() {
      elevation = 4.0;
    });

    Future.delayed(Duration(milliseconds: 100)).then((_) {
      setState(() {
        elevation = 18.0;
      });
      Navigator.of(context)
          .pushNamed(SpecificSearchScreen.routeName, arguments: {
        'category': widget.category.categoryLink,
        'categoryTitle': widget.category.categoryTitle,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 75.0, right: 5),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Card(
          shape: kRoundedCornersShape,
          elevation: elevation,
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
                    widget.category.iconLink,
                    scale: 1.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.category.categoryTitle,
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
