import 'package:books_app/constants.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_book_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowcaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NYT>(
      builder: (BuildContext context, nyt, _) {
        return Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                  child: Text(
                    nyt.getSelectedCategory,
                    style: TextStyle(
                        color: kLightColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  height: 5,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: EdgeInsets.only(bottom: 22.0),
                  decoration: BoxDecoration(
                      color: Color(0xfff5f7f6),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20.0))),
                  child: nyt.getShowcaseBooks.length == 0
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0)),
                              child: Image.asset(
                                'images/bookLoader3.gif',
                              ),
                            ),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              color: Colors.white,
                              padding: EdgeInsets.only(top: 8),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemExtent:
                                      MediaQuery.of(context).size.height * 0.18,
                                  itemCount: nyt.getShowcaseBooks.length,
                                  itemBuilder: (context, i) {
                                    return ShowcaseBookItem(
                                        nyt.getShowcaseBooks[i]);
                                  }),
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
