import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/category_card.dart';
import 'package:the_menu/models/category.dart';
import 'package:the_menu/models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  static const _categories = categoriesMock;

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("The Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _categories.length,
            itemBuilder: (ctx, index) {
              final Category category = _categories[index];
              return CategoryCard(category: category);
            }),
      ),
    );
  }
}
