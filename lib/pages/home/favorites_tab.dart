import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/meal_card.dart';
import 'package:the_menu/models/dummy_data.dart';
import 'package:the_menu/models/meal.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Meal> categoryMeals = mockMeals;

    return Padding(
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
    );
  }
}
