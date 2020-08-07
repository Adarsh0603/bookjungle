import 'dart:async';

import 'package:books_app/constants.dart';
import 'package:books_app/services/connectivity_status.dart';
import 'package:books_app/widgets/network_sensititve.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_header.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_list_bestsellers.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Showcase extends StatefulWidget {
  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var connectivity = Provider.of<ConnectivityStatus>(context);
    if (connectivity != ConnectivityStatus.Offline) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 18.0,
        shadowColor: Colors.white,
        margin: EdgeInsets.only(right: 0, left: 16),
        shape: kBestsellersShowcaseStyle,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
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
