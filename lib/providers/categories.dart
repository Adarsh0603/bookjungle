import 'package:books_app/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> categoriesList = [
    Category('Fiction', 'fiction', 'images/fiction.png'),
    Category('Drama', 'drama', 'images/drama.png'),
    Category('Suspense', 'suspense', 'images/suspense.png'),
    Category('Thriller', 'thriller', 'images/thriller.png'),
    Category('Humor', 'humor', 'images/humor.png'),
    Category('Fantasy', 'fantasy', 'images/fantasy.png'),
    Category('Horror', 'horror', 'images/horror.png'),
    Category('Religious', 'religious', 'images/religious.png'),
    Category('Biography / Autobiography', 'Biography Autobiography',
        'images/biography.png'),
    Category('Education', 'education', 'images/education.png'),
    Category('Historical', 'historical', 'images/history.png'),
    Category('Art and Literature', 'Art and Literature', 'images/art.png'),
    Category(
        'Travel / Photography', 'travel and photography', 'images/travel.png'),
    Category('Cooking', 'cooking', 'images/cooking.png'),
    Category('Sports', 'sports', 'images/sports.png'),
  ];
}
