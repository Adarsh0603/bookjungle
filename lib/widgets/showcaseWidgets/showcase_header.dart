import 'package:books_app/constants.dart';
import 'package:flutter/material.dart';

class ShowcaseHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 32.0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Discover Bestsellers',
            style: kShowcaseHeaderTextStyle,
          ),
          Text(
            'Weekly list of New York Times bestsellers \nfrom different categories..',
            style: TextStyle(fontSize: 12.0, color: kLightColor),
          ),
        ],
      ),
    );
  }
}
