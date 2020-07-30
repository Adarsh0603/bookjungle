class Book {
  final String id;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final List<String> authors;
  final String previewLink;
  final String infoLink;

  final String buyLink;
  final List<String> categories;
  final String description;
  final String publisher;
  final String publishedDate;
  final String pdfUrl;
  final String averageRating;
  final String webReaderLink;
  final int pageCount;

  Book(
      {this.id,
      this.title,
      this.subtitle,
      this.thumbnailUrl,
      this.authors,
      this.previewLink,
      this.infoLink,
      this.buyLink,
      this.categories,
      this.description,
      this.publisher,
      this.publishedDate,
      this.pdfUrl,
      this.averageRating,
      this.webReaderLink,
      this.pageCount});
}
