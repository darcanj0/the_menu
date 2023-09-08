import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_menu/pages/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theMenuTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 218, 12, 12))
          .copyWith(
        background: const Color.fromARGB(255, 238, 235, 207),
      ),
      textTheme: GoogleFonts.notoSerifDisplayTextTheme(),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'The Menu',
      theme: theMenuTheme.copyWith(
        textTheme: GoogleFonts.notoSerifTextTheme(
          theMenuTheme.textTheme.copyWith(
              headlineLarge:
                  GoogleFonts.vollkornTextTheme().headlineLarge!.copyWith(
                        color: theMenuTheme.colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                      ),
              headlineMedium: TextStyle(
                color: theMenuTheme.colorScheme.onInverseSurface,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      home: const CategoriesPage(),
    );
  }
}
