import 'package:books_app/models/category.dart';
import 'package:flutter/cupertino.dart';

class Categories with ChangeNotifier {
  List<Category> categoriesList = [
    Category('Art & Literature', 'Art and Literature', 'images/art.png'),
    Category('Biography /\n Autobiography', 'Biography Autobiography',
        'images/biography.png'),
    Category('Cooking', 'cooking', 'images/cooking.png'),
    Category('Drama', 'drama', 'images/drama.png'),
    Category('Education', 'Education', 'images/education.png'),
    Category('Fantasy', 'fantasy', 'images/fantasy.png'),
    Category('Fiction', 'fiction', 'images/fiction.png'),
    Category('Historical', 'historical', 'images/history.png'),
    Category('Horror', 'horror', 'images/horror.png'),
    Category('Humor', 'humor', 'images/humor.png'),
    Category('Religious', 'religious', 'images/religious.png'),
    Category('Sports', 'sports', 'images/sports.png'),
    Category('Suspense', 'suspense', 'images/suspense.png'),
    Category('Thriller', 'thriller', 'images/thriller.png'),
    Category('Travel /\n Photography', 'Travel and Photography',
        'images/travel.png'),
  ];
}
