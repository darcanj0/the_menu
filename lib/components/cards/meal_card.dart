import 'package:flutter/material.dart';
import 'package:the_menu/utils/routes.dart';

import '../../models/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({required this.meal, super.key});

  static const double cardElevation = 3;
  static const double cardOuterPadding = 2.5;
  static const double cardInnerPadding = 8;
  static const double cardBorderRadius = 5;
  static const double infoAreaPadding = 10;

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.mealDetails.name, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: cardOuterPadding),
      child: Card(
        color: colorScheme.primaryContainer,
        elevation: cardElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardBorderRadius)),
        child: InkWell(
          onTap: () => selectMeal(context),
          child: Padding(
            padding: const EdgeInsets.only(bottom: cardInnerPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MealImage(
                  meal: meal,
                  textTheme: textTheme,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: infoAreaPadding, left: infoAreaPadding),
                  child: MealInfo(meal: meal, textTheme: textTheme),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: infoAreaPadding, left: infoAreaPadding),
                  child: MealBadges(meal: meal, textTheme: textTheme),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MealImage extends StatelessWidget {
  final Meal meal;
  final TextTheme textTheme;

  const MealImage({super.key, required this.meal, required this.textTheme});

  static const EdgeInsetsGeometry imagePadding = EdgeInsets.only(right: 5);
  static const double imageSize = 250;
  static const Radius radius = Radius.circular(5);
  static const BorderRadius borderRadius =
      BorderRadius.only(topLeft: radius, topRight: radius);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageSize,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(children: [
          Ink(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(meal.imagePath),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 5,
            child: Container(
              width: 250,
              color: Colors.black54,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                meal.name,
                textAlign: TextAlign.center,
                style: textTheme.titleLarge,
                overflow: TextOverflow.fade,
                softWrap: true,
              ),
            ),
          )
        ]),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meal.description,
          style: textTheme.labelLarge,
        ),
        Text(
          'U\$ ${meal.price.toStringAsFixed(2)}',
          style: textTheme.titleMedium,
        ),
      ],
    );
  }
}

class MealBadges extends StatelessWidget {
  final Meal meal;
  final TextTheme textTheme;
  const MealBadges({required this.meal, required this.textTheme, super.key});

  Widget getBadge(IconData icon, String label) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Icon(icon, size: 20),
            Text(
              label,
              style: textTheme.labelSmall,
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getBadge(Icons.people, '${meal.servesHowManyPeople}'),
        getBadge(Icons.timer, '${meal.durationInMinutes} min'),
        if (meal.isGlutenFree) getBadge(Icons.block, 'No Gluten'),
        if (meal.isDairyFree) getBadge(Icons.water_drop, 'No Lactose'),
        if (meal.isVeggie) getBadge(Icons.compost, 'Veggie'),
        if (meal.isVegan) getBadge(Icons.cruelty_free, 'Vegan'),
      ],
    );
  }
}
