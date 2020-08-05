import 'dart:math';

import 'package:books_app/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ShowcaseBookItem extends StatelessWidget {
  final Book book;

  ShowcaseBookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            elevation: 18.0,
//            isScrollControlled: true,
//            barrierColor: kBarrierColor,
            context: context,
            builder: (context) {
              return ShowcaseSearchBottomSheet(book);
            });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                shape: kRoundedCornersShape,
                elevation: 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    book.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              Utils.trimString(book.singleAuthor, 15),
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                  color: kLightColor),
            ),
            Expanded(
              child: Text(
                Utils.trimString(book.title, 15),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
