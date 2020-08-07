import 'package:books_app/constants.dart';
import 'package:books_app/widgets/network_sensititve.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_header.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_list_bestsellers.dart';

import 'package:flutter/material.dart';

class Showcase extends StatefulWidget {
  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 18.0,
        shadowColor: Colors.white,
        margin: EdgeInsets.only(right: 0, left: 16),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowcaseHeader(),
              NetworkSensitive(
                child: ShowcaseList(),
                offlineChild: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: Container(
                      width: 200,
                      child: Image.asset('images/nointerneticon.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
