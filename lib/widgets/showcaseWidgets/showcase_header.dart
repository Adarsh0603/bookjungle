import 'package:books_app/constants.dart';
import 'package:books_app/screens/bestsellers_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowcaseHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 32.0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Discover Bestsellers',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(BestSellersScreen.routeName);
                  },
                  child: SizedBox(
                    width: 70.0,
                    child: Center(
                      child: Text('see all',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kLightColor,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
          Text(
            'Weekly list of New York Times bestsellers \nfrom different categories..',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              fontSize: 12.0,
              color: kLightColor,
            )),
          ),
        ],
      ),
    );
  }
}
