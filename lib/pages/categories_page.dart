import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/category_card.dart';
import 'package:the_menu/models/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  static const _categories = categoriesMock;

  List<Widget> get _categoriesCards =>
      _categories.map((cat) => CategoryCard(category: cat)).toList();

  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("The Menu"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 1 / 2,
            children: _categoriesCards,
          ),
        ));
  }
}
