import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/books_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpecificSearchScreen extends StatelessWidget {
  static const routeName = '/specific-search-screen';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> searchArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    Provider.of<Books>(context, listen: false).setStartIndex();
    Provider.of<Books>(context, listen: false)
        .toggleTotalItemsCalculation(true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'Search results for:',
                        style: TextStyle(color: kLightColor, fontSize: 12),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        searchArgs['bookTitle'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              FutureBuilder(
                future: Provider.of<Books>(context, listen: false)
                    .getSearchedBookByArgs(searchArgs),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    Provider.of<Books>(context, listen: false)
                        .toggleTotalItemsCalculation(false);

                    return BooksGrid();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
