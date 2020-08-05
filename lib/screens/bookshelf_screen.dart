import 'package:books_app/providers/bookshelf.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/saved_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class BookShelfScreen extends StatefulWidget {
  static const routeName = '/bookshelf';

  @override
  _BookShelfScreenState createState() => _BookShelfScreenState();
}

class _BookShelfScreenState extends State<BookShelfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: NavBar(BookShelfScreen.routeName),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.11),
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
                return Future.delayed(Duration.zero);
              },
              child: Consumer<Bookshelf>(
                builder: (BuildContext context, bookshelf, Widget child) {
                  return Container(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Bookshelf',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future:
                                Provider.of<Bookshelf>(context, listen: false)
                                    .fetchAndSetBooks(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              return snapshot.connectionState ==
                                      ConnectionState.waiting
                                  ? Center(child: CircularProgressIndicator())
                                  : bookshelf.savedBooks.length <= 0
                                      ? EmptyBookshelfWidget()
                                      : ListView.builder(
                                          itemCount:
                                              bookshelf.savedBooks.length,
                                          itemBuilder: (ctx, i) =>
                                              SavedBookItem(bookshelf
                                                  .savedBooks.reversed
                                                  .toList()[i]),
                                        );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyBookshelfWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Click ",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            WidgetSpan(
              child: Icon(
                Icons.bookmark_border,
                size: 18,
              ),
            ),
            TextSpan(
              text: " to add books to the bookshelf",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
