import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_menu/models/cart.dart';
import 'package:the_menu/models/dummy_data.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/models/settings.dart';
import 'package:the_menu/pages/all_meals_page.dart';
import 'package:the_menu/pages/cart_page.dart';
import 'package:the_menu/pages/home/categories_tab.dart';
import 'package:the_menu/pages/category_meals_page.dart';
import 'package:the_menu/pages/meal_details_page.dart';
import 'package:the_menu/pages/home/tabs_page.dart';
import 'package:the_menu/pages/settings_page.dart';
import 'package:the_menu/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //filters
  static const List<Meal> allMeals = mockMeals;

  List<Meal> avaliableMeals = [];

  Settings settings = Settings(
      isGlutenFree: false, isDairyFree: false, isVegan: false, isVeggie: false);

  void onSettingsChanged(Settings newSettings) {
    setState(() {
      settings = newSettings;
      avaliableMeals = filteredMeals;
    });
  }

  List<Meal> get filteredMeals => allMeals.where((element) {
        final filterVegan = settings.isVegan && !element.isVegan;
        final filterVeggie = settings.isVeggie && !element.isVeggie;
        final filterDairy = settings.isDairyFree && !element.isDairyFree;
        final filterGluten = settings.isGlutenFree && !element.isGlutenFree;
        return !filterGluten && !filterDairy && !filterVegan && !filterVeggie;
      }).toList();

  //favorites
  List<Meal> favoriteMeals = [];

  void toggleFavoriteMeal(Meal meal) {
    setState(() {
      favoriteMeals.contains(meal)
          ? favoriteMeals.remove(meal)
          : favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) => favoriteMeals.contains(meal);

  //cart
  Cart cart = Cart(items: []);

  void addToCart(CartItem item) => setState(() => cart.addItem(item));

  void removeFromCart(CartItem item) => setState(() {
        cart.removeItem(item);
      });

  void changeItemAmmount(CartItem item, int newAmmount) =>
      setState(() => cart.changeAmmount(item, newAmmount));

  @override
  Widget build(BuildContext context) {
    final TextTheme originalTextTheme = Theme.of(context).textTheme;

    final ColorScheme theMenuColorScheme =
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 247, 76, 76));

    final TextTheme theMenuTextTheme =
        GoogleFonts.vollkornTextTheme(originalTextTheme).copyWith(
      headlineLarge: GoogleFonts.vollkorn(
        textStyle: originalTextTheme.headlineLarge!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: theMenuColorScheme.onBackground,
        ),
      ),
      headlineMedium: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        fontSize: 35,
        color: theMenuColorScheme.onInverseSurface,
      ),
      titleLarge: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        color: theMenuColorScheme.onInverseSurface,
      ),
      titleMedium: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        color: theMenuColorScheme.onPrimaryContainer,
        fontSize: 20,
      ),
      labelSmall: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
      labelLarge: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: theMenuColorScheme.onBackground,
      ),
      labelMedium: GoogleFonts.vollkorn(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: theMenuColorScheme.onPrimary,
      ),
    );

    final ThemeData theMenuTheme = ThemeData(
      textTheme: theMenuTextTheme,
      colorScheme: theMenuColorScheme,
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'The Menu',
      theme: theMenuTheme,
      home: TabsPage(
        favoriteMeals: favoriteMeals,
      ),
      routes: {
        AppRoutes.categories.name: (_) =>
            TabsPage(favoriteMeals: favoriteMeals),
        AppRoutes.categoryMeals.name: (_) =>
            CategoryMealsPage(filteredMeals: filteredMeals),
        AppRoutes.cart.name: (_) => CartPage(
              cart: cart,
              onRemove: removeFromCart,
              onChangeAmmount: changeItemAmmount,
            ),
        AppRoutes.mealDetails.name: (_) => MealDetailsPage(
              onToggleFavorite: toggleFavoriteMeal,
              isFavorite: isFavorite,
              onAddToCart: addToCart,
            ),
        AppRoutes.allMeals.name: (_) =>
            AllMealsPage(filteredMeals: filteredMeals),
        AppRoutes.settings.name: (_) => SettingsPage(
              settings: settings,
              onSettingsChanged: onSettingsChanged,
            )
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (_) => const CategoriesTab()),
    );
  }
}
