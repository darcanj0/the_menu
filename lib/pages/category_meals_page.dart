import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/components/buttons/cart_float_button.dart';
import 'package:the_menu/components/cards/meal_card.dart';
import 'package:the_menu/models/category.dart';
import 'package:the_menu/models/meal.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({required this.filteredMeals, super.key});

  final List<Meal> filteredMeals;

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    final List<Meal> categoryMeals = filteredMeals
        .where((element) => element.categoriesIds.contains(category.id))
        .toList();

    return Scaffold(
      appBar: TheMenuAppBar(title: category.title),
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
      floatingActionButton: const CartFloatButton(),
    );
  }
}
