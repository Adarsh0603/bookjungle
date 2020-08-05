import 'dart:convert';

import 'package:books_app/constants.dart';
import 'package:books_app/models/book.dart';
import 'package:books_app/models/category.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BestSellerCategoryItem extends StatefulWidget {
  final Category category;

  BestSellerCategoryItem(this.category);

  @override
  _BestSellerCategoryItemState createState() => _BestSellerCategoryItemState();
}

class _BestSellerCategoryItemState extends State<BestSellerCategoryItem> {
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
    final openHeight = MediaQuery.of(context).size.height * 0.4;

    return GestureDetector(
      onTap: () async {
        setState(() {
          open = !open;
          open ? elevation = 18 : elevation = 0;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 8.0, top: 8.0, right: 8.0, bottom: open ? 12 : 0),
        child: Material(
          elevation: elevation,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      widget.category.categoryTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: open ? 32 : 16),
                    ),
                  ),
                  if (open) Divider(),
                  SizedBox(height: 5),
                  if (open)
                    FutureBuilder(
                      future:
                          getSelectedBestsellers(widget.category.categoryLink),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        return snapshot.connectionState ==
                                ConnectionState.waiting
                            ? Container(
                                height: openHeight,
                                child: Image.asset('images/bookLoader3.gif'))
                            : snapshot.hasError
                                ? Center(
                                    child: Text('Retry'),
                                  )
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: openHeight * 0.15,
                                        horizontal: 0.0),
                                    height: openHeight,
                                    color: kBestSellerCategoryItemColor,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemExtent:
                                            MediaQuery.of(context).size.height *
                                                0.18,
                                        itemCount:
                                            _bestsellersForSelectedCategory
                                                .length,
                                        itemBuilder: (context, i) {
                                          return ShowcaseBookItem(
                                              _bestsellersForSelectedCategory[
                                                  i]);
                                        }),
                                  );
                      },
                    ),
                  if (open) SizedBox(height: 10),
                  if (open)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Books Between\n${widget.category.oldDate.substring(0, 4)} - ${widget.category.newDate.substring(0, 4)}',
                          style: TextStyle(fontSize: 12, color: kLightColor),
                        ),
                        Text(
                          'Updated\n${widget.category.updated}',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 12, color: kLightColor),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
