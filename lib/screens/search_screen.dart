import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/books_grid.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:books_app/widgets/network_sensititve.dart';
import 'package:books_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool loadGrid = false;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Future.delayed(Duration.zero).then((_) {
      Provider.of<Books>(context, listen: false).clearList();
      setState(() {
        loadGrid = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(SearchScreen.routeName),
      body: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 2,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bg.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 32.0, left: 16.0, right: 16.0, bottom: 2.0),
                      child: SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Discover',
                              style: kSearchScreenHeaderStyle,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                'Search books based on your needs with book title or author name',
                                style: GoogleFonts.notoSans(
                                    textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                  letterSpacing: 0.2,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              NetworkSensitive(offlineChild: Container(), child: SearchBar()),
            ],
          ),
          if (loadGrid)
            BooksGrid(
              routeName: SearchScreen.routeName,
            ),
        ],
      ),
    );
  }
}
