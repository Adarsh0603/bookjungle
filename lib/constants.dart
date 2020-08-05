import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//--------Colors-----//
const kLightColor = Colors.teal;
const kPrimaryColor = Color(0xff0DB067);
//-----SearchScreen-------//
//HEADER
const kSearchScreenHeaderStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

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

//-----------------------Showcase--------///
const kBestsellerShowcaseRadius = 35.0;
const kBestsellersShowcaseStyle = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(kBestsellerShowcaseRadius),
    bottomLeft: Radius.circular(kBestsellerShowcaseRadius),
  ),
);
const kShowcaseHeaderTextStyle =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0);

const kCategoryItemShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

//bestseller Categories
final kBestSellerCategoryItemColor = Colors.grey[50];
