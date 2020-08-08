import 'package:books_app/constants.dart';
import 'package:books_app/providers/books.dart';
import 'package:books_app/screens/book_detail_screen.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                color: Colors.grey[100],
                shape: kRoundedCornersShape,
                elevation: 4.0,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(kRoundedCornerRadius)),
                  child: FadeInImage.memoryNetwork(
                    image: book.thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.0),
          Expanded(
            flex: 1,
            child: Text(
              book.title != null ? Utils.trimString(book.title, 16) : '---',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: GoogleFonts.montserrat(
                  textStyle:
                      TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
