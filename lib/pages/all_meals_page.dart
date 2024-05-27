import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/stores/meal.store.dart';
import 'package:the_menu/utils/universal_scroll.dart';

import '../components/cards/meal_card.dart';
import '../components/helpers/meals_not_found.dart';

class AllMealsPage extends StatelessWidget {
  const AllMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TheMenuAppBar(title: 'All Meals'),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final filteredMeals = context.watch<MealStore>().favoriteMeals;
            return filteredMeals.isEmpty
                ? Center(
                    child: MealsNotFound(
                      imageWidth: constraints.maxWidth * 0.8,
                    ),
                  )
                : SizedBox(
                    width: constraints.maxWidth,
                    child: UniversalScroll(
                      child: ListView.builder(
                          itemCount: filteredMeals.length,
                          itemBuilder: (ctx, index) =>
                              MealCard(meal: filteredMeals[index])),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
