import 'package:books_app/constants.dart';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/showcaseWidgets/showcase_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ShowcaseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NYT>(
      builder: (BuildContext context, nyt, _) {
        print(nyt.getSelectedCategory);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16.0),
              child: Text(
                nyt.getSelectedCategory,
                style:
                    TextStyle(color: kLightColor, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: nyt.getShowcaseBooks.length == 0
                  ? Center(
                      child: SpinKitWave(
                        color: Colors.green,
                        size: 30,
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemExtent:
                                  MediaQuery.of(context).size.height * 0.18,
                              itemCount: nyt.getShowcaseBooks.length,
                              itemBuilder: (context, i) {
                                return ShowcaseBookItem(
                                    nyt.getShowcaseBooks[i].rank);
                              }),
                        ),
                      ],
                    ),
            ),
          ],
        );
      },
    );
  }
}
