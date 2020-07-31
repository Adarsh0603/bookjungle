import 'package:books_app/models/book.dart';
import 'package:books_app/services/utils.dart';
import 'package:flutter/material.dart';

class ActionsWidget extends StatelessWidget {
  final Book book;
  ActionsWidget(this.book);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ActionButton(
          icon: Icons.chrome_reader_mode,
          label: 'PREVIEW',
          onPressed: () async {
            print(book.previewLink);
            await Utils.launchURL(book.previewLink);
          },
        ),
        SizedBox(width: 5.0),
        ActionButton(
          label: book.saleability != 'FOR_SALE'
              ? 'N/A'
              : '${book.amount} ${book.currencyCode}',
          onPressed: book.saleability != 'FOR_SALE'
              ? null
              : () async {
                  print(book.buyLink);
                  await Utils.launchURL(book.buyLink);
                },
          icon: Icons.shop,
        ),
        SizedBox(width: 5.0),
        ActionButton(
          label: 'READ',
          icon: Icons.import_contacts,
          onPressed: book.accessViewStatus != 'SAMPLE'
              ? null
              : () async {
                  print(book.webReaderLink);
                  await Utils.launchURL(book.webReaderLink);
                },
        ),
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  ActionButton(
      {@required this.icon, @required this.label, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlineButton.icon(
      label: Text(
        label,
        style: TextStyle(fontSize: 10.0),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 16.0,
      ),
    );
  }
}
