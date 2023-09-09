import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';

import '../models/meal.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    String getYesNo(bool prop) => prop ? 'Yes' : 'No';

    List<Widget> getMealBadges = [
      BadgeListItem(
        icon: Icons.timer,
        label: 'Prep time',
        data: '${meal.durationInMinutes.toString()} min',
        colorScheme: colorScheme,
      ),
      BadgeListItem(
        icon: Icons.people,
        label: 'Serves',
        data: meal.servesHowManyPeople.toString(),
        colorScheme: colorScheme,
      ),
      BadgeListItem(
        icon: Icons.block,
        label: 'Gluten Free',
        data: getYesNo(meal.isGlutenFree),
        colorScheme: colorScheme,
      ),
      BadgeListItem(
        icon: Icons.water_drop,
        label: 'Lactose Free',
        data: getYesNo(meal.isDairyFree),
        colorScheme: colorScheme,
      ),
      BadgeListItem(
        icon: Icons.compost,
        label: 'Vegetarian',
        data: getYesNo(meal.isVeggie),
        colorScheme: colorScheme,
      ),
      BadgeListItem(
        icon: Icons.cruelty_free,
        label: 'Vegan',
        data: getYesNo(meal.isVegan),
        colorScheme: colorScheme,
      ),
    ];

    return Scaffold(
      appBar: TheMenuAppBar(title: meal.name),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MealImage(meal: meal),
              MealInfo(meal: meal, textTheme: textTheme),
              MealDetails(
                getMealBadges: getMealBadges,
                colorScheme: colorScheme,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        color: Colors.green,
      ),
    );
  }
}

class MealImage extends StatelessWidget {
  const MealImage({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset(
        meal.imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MealInfo extends StatelessWidget {
  const MealInfo({
    super.key,
    required this.meal,
    required this.textTheme,
  });

  final Meal meal;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.name,
            style: textTheme.titleMedium,
          ),
          Text(
            meal.description,
            style: textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.getMealBadges, required this.colorScheme});

  final ColorScheme colorScheme;
  final List<Widget> getMealBadges;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: LayoutBuilder(
          builder: (ctx, constraints) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Container(
              height: 150,
              width: constraints.maxWidth * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline, width: 3.5),
              ),
              child: ListView(
                shrinkWrap: true,
                children: getMealBadges,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BadgeListItem extends StatelessWidget {
  const BadgeListItem({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
    required this.colorScheme,
  });

  final IconData icon;
  final String label;
  final String data;
  final ColorScheme colorScheme;

  static const double itemHeight = 50;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            height: itemHeight,
            decoration: BoxDecoration(
                border: Border.all(color: colorScheme.outline, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(icon), Text(label)],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              height: itemHeight,
              decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.outline, width: 1)),
              child: Center(child: Text(data))),
        )
      ],
    );
  }
}
