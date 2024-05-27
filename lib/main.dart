import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/pages/all_meals_page.dart';
import 'package:the_menu/pages/cart_page.dart';
import 'package:the_menu/pages/category_meals_page.dart';
import 'package:the_menu/pages/home/categories_tab.dart';
import 'package:the_menu/pages/home/tabs_page.dart';
import 'package:the_menu/pages/meal_details_page.dart';
import 'package:the_menu/pages/settings_page.dart';
import 'package:the_menu/stores/cart.store.dart';
import 'package:the_menu/stores/meal.store.dart';
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

    return MultiProvider(
      providers: [
        Provider(
          create: (context) => MealStore(),
        ),
        Provider(
          create: (context) => CartStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Menu',
        theme: theMenuTheme,
        home: const TabsPage(),
        routes: {
          AppRoutes.categories.name: (_) => const TabsPage(),
          AppRoutes.categoryMeals.name: (_) => const CategoryMealsPage(),
          AppRoutes.cart.name: (_) => const CartPage(),
          AppRoutes.mealDetails.name: (_) => const MealDetailsPage(),
          AppRoutes.allMeals.name: (_) => const AllMealsPage(),
          AppRoutes.settings.name: (_) => const SettingsPage()
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => const CategoriesTab()),
      ),
    );
  }
}
