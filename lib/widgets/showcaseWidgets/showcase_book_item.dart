import 'package:books_app/constants.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/services/utils.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowcaseBookItem extends StatelessWidget {
  final int bookRank;

  ShowcaseBookItem(this.bookRank);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<NYT>(context).getShowcaseBook(bookRank);
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
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
            Text(
              Utils.trimString(book.title, 12),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}