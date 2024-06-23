import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/components/buttons/cart_float_button.dart';
import 'package:the_menu/components/cards/meal_card.dart';
import 'package:the_menu/components/helpers/meals_not_found.dart';
import 'package:the_menu/models/category.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/stores/meal.store.dart';
import 'package:the_menu/utils/universal_scroll.dart';

class CategoryMealsPage extends StatelessWidget {
  const CategoryMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: TheMenuAppBar(title: category.title),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final mealStore = context.watch<MealStore>();
            final List<Meal> categoryMeals = mealStore.filteredMeals
                .where((element) => element.categoriesIds.contains(category.id))
                .toList();

            return categoryMeals.isEmpty
                ? Center(
                    child: MealsNotFound(
                      imageWidth: constraints.maxWidth * 0.8,
                    ),
                  )
                : SizedBox(
                    width: constraints.maxWidth,
                    child: UniversalScroll(
                      child: ListView.builder(
                          itemCount: categoryMeals.length,
                          itemBuilder: (ctx, index) =>
                              MealCard(meal: categoryMeals[index])),
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: const CartFloatButton(),
    );
  }
}
