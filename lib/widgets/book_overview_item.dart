import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class BookOverviewItem extends StatelessWidget {
  final String bookId;

  BookOverviewItem(this.bookId);

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Books>(context, listen: false).getBookById(bookId);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            elevation: 18.0,
            isScrollControlled: true,
//            barrierColor: kBarrierColor,
            context: context,
            builder: (context) {
              return BookDetailBottomSheet(book);
            });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Card(
              color: Colors.grey[100],
              shape: kRoundedCornersShape,
              elevation: 4.0,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                child: FadeInImage.memoryNetwork(
                  image: book.thumbnailUrl,
                  fit: BoxFit.fitHeight,
                  placeholder: kTransparentImage,
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Expanded(
            flex: 1,
            child: Text(
              book.title != null ? Utils.trimString(book.title, 22) : '---',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
