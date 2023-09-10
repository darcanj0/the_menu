import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/category_card.dart';
import 'package:the_menu/models/dummy_data.dart';

class CategoriesTab extends StatelessWidget {
  static const _categories = categoriesMock;

  List<Widget> get _categoriesCards =>
      _categories.map((cat) => CategoryCard(category: cat)).toList();

  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        childAspectRatio: 1 / .75,
        children: _categoriesCards,
      ),
    );
  }
}
