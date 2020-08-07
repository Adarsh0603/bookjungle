import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/services/connectivity_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool byTitle = true;
  String searchString;

  void search() async {
    Provider.of<Books>(context, listen: false).setStartIndex();

    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    await Provider.of<Books>(context, listen: false)
        .getSearchedBookData(searchString, byTitle);
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(false);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shadowColor: Colors.black,
      shape: kSearchBarShape,
      child: Container(
        height: kSearchBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      byTitle = !byTitle;
                    });
                  },
                  child: Container(
                      child: Text(
                    byTitle ? 'Search\nTitle' : 'Search\nAuthor',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 10.0, color: kLightColor),
                  )),
                )),
            Container(height: kSearchBarHeight, child: VerticalDivider()),
            Expanded(
              flex: 5,
              child: TextField(
                autofocus: true,
                cursorColor: kSearchBarHintColor,
                decoration: kSearchBarDecoration.copyWith(
                    hintText: byTitle ? 'Search by title' : 'Search by author'),
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  searchString = value;
                },
                onSubmitted: (value) async {
                  if (value == '') return;

                  search();
                },
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  if (searchString.length == 0) return;
                  search();
                },
                child: Icon(
                  Icons.search,
                  color: kSearchBarHintColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
