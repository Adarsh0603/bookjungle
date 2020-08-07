import 'package:books_app/providers/bookshelf.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/saved_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(BookShelfScreen.routeName),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return Future.delayed(Duration.zero);
        },
        child: Consumer<Bookshelf>(
          builder: (BuildContext context, bookshelf, Widget child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  elevation: 2,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/bg.png"),
                            fit: BoxFit.cover)),
                    child: Container(
                      color: Colors.black38,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, bottom: 0, left: 16.0, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Bookshelf',
                                textAlign: TextAlign.end,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
//                Divider(
//                  height: 0,
//                ),
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<Bookshelf>(context, listen: false)
                        .fetchAndSetBooks(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? Center(child: CircularProgressIndicator())
                          : bookshelf.savedBooks.length <= 0
                              ? EmptyBookshelfWidget()
                              : ListView.builder(
                                  itemCount: bookshelf.savedBooks.length,
                                  itemBuilder: (ctx, i) => SavedBookItem(
                                      bookshelf.savedBooks.reversed
                                          .toList()[i]),
                                );
                    },
                  ),
                ),
              ],
            );
          },
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
