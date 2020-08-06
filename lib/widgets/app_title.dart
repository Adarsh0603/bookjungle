import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
      child: Container(
        color: Colors.black38,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Material(
                elevation: 18,
                color: Colors.transparent,
                child: Container(
                  child: Text(
                    'bookjungle',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 36),
                  ),
                ),
              ),

//            Container(
//                width: 48, height: 48, child: Image.asset('images/jungle.png')),
            ],
          ),
        ),
      ),
    );
  }
}
