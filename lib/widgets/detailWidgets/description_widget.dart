import 'package:books_app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  final Book book;

  DescriptionWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'DESCRIPTION',
              style: TextStyle(
                  color: Colors.teal,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Text(
                  book.description,
                  style: GoogleFonts.notoSans(
                      textStyle: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.2,
                  )),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
