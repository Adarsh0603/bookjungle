import 'dart:async';

import 'package:books_app/constants.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_header.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_list_bestsellers.dart';
import 'package:connectivity/connectivity.dart';

import 'package:flutter/material.dart';

class Showcase extends StatefulWidget {
  @override
  _ShowcaseState createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  var _connectionStatus = 'Unknown';
  Connectivity connectivity;
  StreamSubscription<ConnectivityResult> subscription;
  bool isConnected = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectivity = Connectivity();
    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatus = result.toString();
      print(_connectionStatus);
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        setState(() {
          isConnected = true;
        });
      } else {
        setState(() {
          isConnected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 18.0,
        shadowColor: Colors.white,
        margin: EdgeInsets.only(right: 0, left: 20),
        shape: kBestsellersShowcaseStyle,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ShowcaseHeader(),
              isConnected
                  ? ShowcaseList()
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Center(child: Text('NO INTERNET CONNECTION')),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
