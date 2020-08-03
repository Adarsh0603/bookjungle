import 'package:books_app/constants.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_header.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_list_bestsellers.dart';

import 'package:flutter/material.dart';

class Showcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 18.0,
      shadowColor: Colors.white,
      margin: EdgeInsets.only(right: 0, left: 20),
      shape: kBestsellersShowcaseStyle,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ShowcaseHeader(),
            ShowcaseList(),
          ],
        ),
      ),
    );
  }
}
