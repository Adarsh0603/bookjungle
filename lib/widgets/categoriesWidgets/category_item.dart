import 'package:books_app/constants.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.only(
          left: 16, bottom: MediaQuery.of(context).size.height * 0.09 * 1.3),
      child: GestureDetector(
        onTap: navigateToSpecificSearchScreen,
        child: Card(
          shape: kCategoryItemShape,
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
                FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    widget.category.categoryTitle,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
//                      letterSpacing: 0.2,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
