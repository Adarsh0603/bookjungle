import 'package:books_app/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> categoriesList = [
    Category(
        categoryTitle: 'Art & Literature',
        categoryLink: 'Art and Literature',
        iconLink: 'images/art.png'),
    Category(
        categoryTitle: 'Biography /\n Autobiography',
        categoryLink: 'Biography Autobiography',
        iconLink: 'images/biography.png'),
    Category(
        categoryTitle: 'Cooking',
        categoryLink: 'cooking',
        iconLink: 'images/cooking.png'),
    Category(
        categoryTitle: 'Drama',
        categoryLink: 'drama',
        iconLink: 'images/drama.png'),
    Category(
        categoryTitle: 'Education',
        categoryLink: 'Education',
        iconLink: 'images/education.png'),
    Category(
        categoryTitle: 'Fantasy',
        categoryLink: 'fantasy',
        iconLink: 'images/fantasy.png'),
    Category(
        categoryTitle: 'Fiction',
        categoryLink: 'fiction',
        iconLink: 'images/fiction.png'),
    Category(
        categoryTitle: 'Historical',
        categoryLink: 'historical',
        iconLink: 'images/history.png'),
    Category(
        categoryTitle: 'Horror',
        categoryLink: 'horror',
        iconLink: 'images/horror.png'),
    Category(
        categoryTitle: 'Humor',
        categoryLink: 'humor',
        iconLink: 'images/humor.png'),
    Category(
        categoryTitle: 'Religious',
        categoryLink: 'religious',
        iconLink: 'images/religious.png'),
    Category(
        categoryTitle: 'Sports',
        categoryLink: 'sports',
        iconLink: 'images/sports.png'),
    Category(
        categoryTitle: 'Suspense',
        categoryLink: 'suspense',
        iconLink: 'images/suspense.png'),
    Category(
        categoryTitle: 'Thriller',
        categoryLink: 'thriller',
        iconLink: 'images/thriller.png'),
    Category(
        categoryTitle: 'Travel /\n Photography',
        categoryLink: 'Travel and Photography',
        iconLink: 'images/travel.png'),
  ];
}
