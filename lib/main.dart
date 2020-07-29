import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookHouse',
      home: ChangeNotifierProvider(
        create: (BuildContext context) => Books(),
        child: HomeScreen(),
      ),
    );
  }
}
