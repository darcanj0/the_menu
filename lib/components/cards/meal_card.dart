import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({required this.meal, super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: Card(
        semanticContainer: false,
        color: colorScheme.primaryContainer,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MealImage(path: meal.imagePath),
                Expanded(
                  child: MealInfo(meal: meal, textTheme: textTheme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealImage extends StatelessWidget {
  final String path;
  const MealImage({super.key, required this.path});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MealInfo extends StatelessWidget {
  final Meal meal;
  final TextTheme textTheme;
  const MealInfo({required this.meal, required this.textTheme, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.name,
            style: textTheme.titleLarge,
          ),
          Text(meal.price.toString()),
          Text(
            meal.description,
            style: textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}
