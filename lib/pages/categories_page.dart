import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/category_card.dart';
import 'package:the_menu/models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  static const _categories = categoriesMock;

  const CategoriesPage({super.key});
  List<Widget> get textsCategories =>
      _categories.map((e) => CategoryCard(category: e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("The Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: textsCategories,
        ),
      ),
    );
  }
}
