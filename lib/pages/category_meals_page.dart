import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/models/category.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      appBar: TheMenuAppBar(title: category.title),
      body: const Center(
        child: Text('Meals'),
      ),
    );
  }
}
