class Book {
  final String id;
  final String title;
  final String subtitle;
  final String thumbnailUrl;
  final List<String> authors;
  final String previewLink;
  final String buyLink;
  final List<String> categories;
  final String description;
  final String publisher;
  final String publishedDate;
  final String pdfUrl;
  final double averageRating;
  final int ratingsCount;
  final String webReaderLink;
  final int pageCount;

  Book(
      {this.id,
      this.title,
      this.subtitle,
      this.thumbnailUrl,
      this.authors,
      this.previewLink,
      this.buyLink,
      this.categories,
      this.description,
      this.publisher,
      this.publishedDate,
      this.pdfUrl,
      this.averageRating,
      this.ratingsCount,
      this.webReaderLink,
      this.pageCount});
}
