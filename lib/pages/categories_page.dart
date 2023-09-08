import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
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
        appBar: const TheMenuAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.horizontal,
            childAspectRatio: 1 / .75,
            children: _categoriesCards,
          ),
        ));
  }
}
