import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/widgets/detailWidgets/book_details_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class BookDetailBottomSheet extends StatelessWidget {
  final String bookId;

  BookDetailBottomSheet(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context).getBookById(bookId);
    return Container(
      color: Color(0xFF737373).withOpacity(0),
      child: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.80,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32.0),
                topRight: Radius.circular(32.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: (kBookImageHeight / 2) + 40, left: 16.0, right: 16.0),
              child: BookDetailsWidget(book),
            ),
          ),
          Positioned(
            top: -kBookImageHeight / 2,
            child: Card(
              elevation: 10.0,
              shape: kRoundedCornersShape,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  book.thumbnailUrl,
//                  height: kBookImageHeight,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                print(book.infoLink);
                Share.share(
                    'Check out this Book:\n ${book.title} \n ${book.infoLink}');
              },
            ),
          ),
          Positioned(
            right: 20,
            top: 60,
            child: IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: () {
                print('Added to bookshelf');
              },
            ),
          ),
          if (book.isEbook)
            Positioned(
                left: 10,
                top: 60,
                child: Card(
                  elevation: 3.0,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    color: Colors.amberAccent,
                    child: Text(
                      'E-Book',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          Positioned(
            right: 20,
            top: -(kBookImageHeight / 2),
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
