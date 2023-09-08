import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TheMenuAppBar(title: 'Meals'),
      body: Center(
        child: Text('Meals'),
      ),
    );
  }
}
