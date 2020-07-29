import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Books extends ChangeNotifier {
  Future<void> getSearchedBookData(String bookName) async {
    final url = 'https://www.googleapis.com/books/v1/volumes?q=$bookName';
    try {
      http.Response response = await http.get(url);
      var extractedData = await jsonDecode(response.body);
      print(extractedData);
    } catch (e) {
      print(e);
    }
  }
}
