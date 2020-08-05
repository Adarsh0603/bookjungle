import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black,
      shape: kSearchBarShape,
      child: Container(
        height: kSearchBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Hero(
                  tag: 'searchIcon',
                  child: Icon(
                    Icons.search,
                    color: kSearchBarHintColor,
                  ),
                )),
            Expanded(
              flex: 5,
              child: TextField(
                autofocus: true,
                cursorColor: kSearchBarHintColor,
                decoration: kSearchBarDecoration,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) async {
                  if (value == '') return;
                  Provider.of<Books>(context, listen: false).setStartIndex();

                  Provider.of<Books>(context, listen: false)
                      .toggleTotalItemsCalculation(true);
                  await Provider.of<Books>(context, listen: false)
                      .getSearchedBookData(value);
                  Provider.of<Books>(context, listen: false)
                      .toggleTotalItemsCalculation(false);
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(child: Icon(Icons.youtube_searched_for)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
