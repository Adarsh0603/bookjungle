import 'dart:convert';
import 'dart:math';

import 'package:books_app/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BestSellerCategoryCard extends StatefulWidget {
  final Category category;

  BestSellerCategoryCard(this.category);

  @override
  _BestSellerCategoryCardState createState() => _BestSellerCategoryCardState();
}

class _BestSellerCategoryCardState extends State<BestSellerCategoryCard> {
  double elevation = 0;
  List<Book> _bestsellersForSelectedCategory = [];

  Future<void> getSelectedBestsellers(String category) async {
    _bestsellersForSelectedCategory.clear();
    final url =
        'https://api.nytimes.com/svc/books/v3/lists/current/$category.json?api-key=0Db7fWAZAY6kK0Gz3NwcVQiMKf1MUnH9';
    print(url);
    http.Response response = await http.get(url);
    var jsonResponse = await jsonDecode(response.body)['results'];
    List specificBestsellersJson = await jsonResponse['books'];
    List<Book> specificBestsellers = [];
    specificBestsellersJson.forEach((book) {
      specificBestsellers.add(
        Book(
            isbn: book['primary_isbn13'],
            rank: book['rank'],
            title: book['title'],
            singleAuthor: book['author'],
            thumbnailUrl: book['book_image'],
            buyLink: book['amazon_product_url'],
            description: book['description'],
            publisher: book['publisher']),
      );
    });
    _bestsellersForSelectedCategory = specificBestsellers;
  }

  bool open = false;
  @override
  Widget build(BuildContext context) {
    final openHeight = min(MediaQuery.of(context).size.height * 0.4, 400.0);

    return GestureDetector(
      onTap: () async {
        setState(() {
          open = !open;
          open ? elevation = 5 : elevation = 0;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: open ? 8 : 0,
            top: open ? 8 : 0,
            right: open ? 8 : 0,
            bottom: open ? 8 : 0),
        child: Material(
          elevation: elevation,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1, color: Colors.grey[200]))),
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    widget.category.categoryTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: open ? 32 : 16),
                  ),
                ),
                SizedBox(height: 5),
                if (open)
                  FutureBuilder(
                    future:
                        getSelectedBestsellers(widget.category.categoryLink),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Container(
                              color: kBestSellerCategoryCardColor,
                              height: openHeight,
                              child: Center(child: CircularProgressIndicator())
//                                  Image.asset('images/bookLoader3.gif'),
                              )
                          : snapshot.hasError
                              ? Container(
                                  color: kBestSellerCategoryCardColor,
                                  height: openHeight,
                                  child: Center(
                                    child: Text(
                                        'Unable to load books.\nTry again after some time. '),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: openHeight * 0.1,
                                      horizontal: 0.0),
                                  height: openHeight,
                                  color: kBestSellerCategoryCardColor,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemExtent:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      itemCount: _bestsellersForSelectedCategory
                                          .length,
                                      itemBuilder: (context, i) {
                                        return ShowcaseBookItem(
                                            _bestsellersForSelectedCategory[i]);
                                      }),
                                );
                    },
                  ),
                if (open) SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Published Between\n${widget.category.oldDate.substring(0, 4)} - ${widget.category.newDate.substring(0, 4)}',
                        style: TextStyle(fontSize: 12, color: kLightColor),
                      ),
                      Text(
                        'Updated\n${widget.category.updated}',
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 12, color: kLightColor),
                      )
                    ],
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
