class Book {
  final String id;
  final int rank;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final List<String> authors;
  final String singleAuthor;
  final String previewLink;
  final String infoLink;
  final String isbn;
  final String buyLink;
  final List<String> categories;
  final String description;
  final String publisher;
  final String publishedDate;
  final String averageRating;
  final String webReaderLink;
  final int pageCount;
  final bool isEbook;
  final String saleability;
  final String amount;
  final String currencyCode;
  final String accessViewStatus;

  Book(
      {this.id,
      this.rank,
      this.title,
      this.subtitle,
      this.thumbnailUrl,
      this.authors,
      this.singleAuthor,
      this.previewLink,
      this.infoLink,
      this.isbn,
      this.buyLink,
      this.categories,
      this.description,
      this.publisher,
      this.publishedDate,
      this.averageRating,
      this.webReaderLink,
      this.pageCount,
      this.isEbook,
      this.saleability,
      this.amount,
      this.currencyCode,
      this.accessViewStatus});
}
