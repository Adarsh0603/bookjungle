import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/categoriesWidgets/bestseller_category_card.dart';
import 'package:books_app/widgets/network_sensititve.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BestSellersScreen extends StatelessWidget {
  static const routeName = '/best-sellers-screen';

  @override
  Widget build(BuildContext context) {
    final nyt = Provider.of<NYT>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 2,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/bg.png"),
                          fit: BoxFit.cover)),
                  width: double.infinity,
                  child: Container(
                    color: Colors.black38,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32, left: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'New York Times',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Bestsellers',
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: NetworkSensitive(
                offlineChild: Center(
                  child: Image.asset('images/nointernet.png'),
                ),
                child: ListView.builder(
                    itemCount: nyt.getAllCategories.length,
                    itemBuilder: (ctx, i) =>
                        BestSellerCategoryCard(nyt.getAllCategories[i])),
              )),
            ],
          ),
        ));
  }
}
