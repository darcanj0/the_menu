import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_menu/pages/cart_page.dart';
import 'package:the_menu/pages/categories_page.dart';
import 'package:the_menu/pages/category_meals_page.dart';
import 'package:the_menu/utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final TextTheme originalTextTheme = Theme.of(context).textTheme;

    final ColorScheme theMenuColorScheme =
        ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 218, 12, 12))
            .copyWith(
      background: const Color.fromARGB(255, 240, 236, 200),
    );

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
              fontSize: 25,
              color: theMenuColorScheme.onInverseSurface,
            ));

    final ThemeData theMenuTheme = ThemeData(
      textTheme: theMenuTextTheme,
      colorScheme: theMenuColorScheme,
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'The Menu',
      theme: theMenuTheme,
      home: const CategoriesPage(),
      routes: {
        AppRoutes.categoryMeals.name: (_) => const CategoryMealsPage(),
        AppRoutes.cart.name: (_) => const CartPage()
      },
    );
  }
}
