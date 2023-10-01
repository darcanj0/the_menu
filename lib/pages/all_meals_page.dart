import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/models/meal.dart';

import '../components/cards/meal_card.dart';

class AllMealsPage extends StatelessWidget {
  const AllMealsPage({required this.filteredMeals, super.key});

  final List<Meal> filteredMeals;

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
                itemCount: filteredMeals.length,
                itemBuilder: (ctx, index) =>
                    MealCard(meal: filteredMeals[index])),
          ),
        ),
      ),
    );
  }
}
