import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:books_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Books(),
      child: MaterialApp(
        theme: ThemeData(
            bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: Colors.black.withOpacity(0))),
        debugShowCheckedModeBanner: false,
        title: 'BookHouse',
        home: HomeScreen(),
        routes: {
          SearchScreen.routeName: (context) => SearchScreen(),
        },
      ),
    );
  }
}
