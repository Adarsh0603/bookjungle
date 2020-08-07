import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//--------Colors-----//
const kLightColor = Colors.teal;
const kPrimaryColor = Color(0xff0DB067);
//-----SearchScreen-------//
//HEADER
final kSearchScreenHeaderStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white));

//SEARCH BAR
const kSearchBarRadius = 15.0;
const kSearchBarHeight = 56.0;
const kSearchBarHintColor = Colors.black38;
const kSearchBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(kSearchBarRadius),
  ),
);

const kRoundedCornerRadius = 8.0;
const kRoundedCornersShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(kRoundedCornerRadius),
  ),
);

const kSearchBarDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
    hintText: 'Search book',
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

//-----------------------Showcase--------///
const kBestsellerShowcaseRadius = 35.0;

const kCategoryItemShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

//bestseller Categories
final kBestSellerCategoryCardColor = Colors.grey[100];
