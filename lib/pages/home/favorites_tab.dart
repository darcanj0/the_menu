import 'package:flutter/material.dart';
import 'package:the_menu/components/cards/meal_card.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/utils/universal_scroll.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({required this.favoriteMeals, super.key});

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: LayoutBuilder(
        builder: (context, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: favoriteMeals.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                        fit: BoxFit.contain,
                        width: constraints.maxWidth * 0.8,
                        image: const AssetImage(
                            'assets/images/meals/not_found.png')),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'No meals here',
                      style: textTheme.labelLarge,
                    ),
                    const Text("You haven't favorited any meals yet!")
                  ],
                )
              : UniversalScroll(
                  child: ListView.builder(
                      itemCount: favoriteMeals.length,
                      itemBuilder: (ctx, index) =>
                          MealCard(meal: favoriteMeals[index])),
                ),
        ),
      ),
    );
  }
}
