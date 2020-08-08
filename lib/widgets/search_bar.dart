import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool byTitle = true;
  String searchString;
  bool free = false;

  void search() async {
    Provider.of<Books>(context, listen: false).setStartIndex();

    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    await Provider.of<Books>(context, listen: false)
        .getSearchedBookData(searchString, byTitle, free);
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
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              free = !free;
                              search();
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            child: Center(
                              child: Text(
                                free ? 'FREE' : 'ALL',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          height: kSearchBarHeight, child: VerticalDivider()),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              byTitle = !byTitle;
                              search();
                            });
                          },
                          child: Container(
                              child: Center(
                            child: Text(
                              byTitle ? 'TITLE' : 'AUTHOR',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                      ),
                    ],
                  )),
              Container(height: kSearchBarHeight, child: VerticalDivider()),
              Expanded(
                flex: 6,
                child: TextField(
                  autofocus: true,
                  cursorColor: kSearchBarHintColor,
                  decoration: kSearchBarDecoration.copyWith(
                      hintText:
                          byTitle ? 'Search by title' : 'Search by author'),
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (searchString == null) return;
                      if (searchString != null &&
                          searchString.trim().length == 0) return;

                      search();
                    },
                    child: Icon(
                      Icons.search,
                      color: kSearchBarHintColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
