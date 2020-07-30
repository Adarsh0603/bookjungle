import 'package:books_app/screens/book_detail_bottom_sheet.dart';
import 'package:flutter/material.dart';

//--------Colors-----//
const kLightColor = Colors.teal;

//-----SearchScreen-------//
//HEADER
const kSearchScreenHeaderStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

//SEARCH BAR
const kSearchBarRadius = 15.0;
const kSearchBarHeight = 42.0;
const kSearchBarHintColor = Colors.black38;
const kSearchBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(kSearchBarRadius),
  ),
);

const kSearchBarDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
    hintText: 'Search by name, author',
    hintStyle: TextStyle(
      color: kSearchBarHintColor,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(kSearchBarRadius),
      ),
    ),
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none);

//----------BookDetailBottomSheet--------///
const kBookImageHeight = 180.0;

final kBarrierColor = Color(0xffE7F2F9);
