import 'package:flutter/material.dart';
import 'package:the_menu/models/dummy_data.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/models/settings.dart';

class MealStore with ChangeNotifier {
  final List<Meal> _meals = mockMeals;

  List<Meal> get meals => [..._meals];

  MealFilter mealFilters = MealFilter.clear();

  void onFilterChanged(MealFilter newFilter) {
    mealFilters = newFilter;
    notifyListeners();
  }

  List<Meal> get filteredMeals => _meals.where((element) {
        final filterVegan = mealFilters.isVegan && !element.isVegan;
        final filterVeggie = mealFilters.isVeggie && !element.isVeggie;
        final filterDairy = mealFilters.isDairyFree && !element.isDairyFree;
        final filterGluten = mealFilters.isGlutenFree && !element.isGlutenFree;
        return !filterGluten && !filterDairy && !filterVegan && !filterVeggie;
      }).toList();

  final List<Meal> _favoriteMeals = [];

  List<Meal> get favoriteMeals => [..._favoriteMeals];

  void toggleFavoriteMeal(Meal meal) {
    favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);

    notifyListeners();
  }

  bool isFavorite(Meal meal) => favoriteMeals.contains(meal);
}
