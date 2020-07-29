import 'package:flutter/material.dart';

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
