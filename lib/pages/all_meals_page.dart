import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';

import '../components/cards/meal_card.dart';
import '../models/dummy_data.dart';

class AllMealsPage extends StatelessWidget {
  const AllMealsPage({super.key});

  static const categoryMeals = mockMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TheMenuAppBar(title: 'All Meals'),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) => SizedBox(
            width: constraints.maxWidth,
            child: ListView.builder(
                itemCount: categoryMeals.length,
                itemBuilder: (ctx, index) =>
                    MealCard(meal: categoryMeals[index])),
          ),
        ),
      ),
    );
  }
}
