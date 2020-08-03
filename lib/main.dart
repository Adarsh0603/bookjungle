import 'package:books_app/providers/books.dart';
import 'package:books_app/providers/bookshelf.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/screens/bookshelf_screen.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:books_app/screens/search_screen.dart';
import 'package:books_app/screens/specific_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => Books(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => NYT(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => Bookshelf(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0))),
        debugShowCheckedModeBanner: false,
        title: 'BookHouse',
        home: HomeScreen(),
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
          BookShelfScreen.routeName: (context) => BookShelfScreen(),
          SpecificSearchScreen.routeName: (context) => SpecificSearchScreen(),
        },
      ),
    );
  }
}
