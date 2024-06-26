import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/models/cart.dart';
import 'package:the_menu/stores/cart.store.dart';
import 'package:the_menu/stores/meal.store.dart';
import 'package:the_menu/utils/routes.dart';
import 'package:the_menu/utils/universal_scroll.dart';

import '../models/meal.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  late int ammount = 1;

  void addOne() {
    setState(() {
      ammount += 1;
    });
  }

  void removeOne() {
    if (ammount > 1) {
      setState(() {
        ammount -= 1;
      });
    }
  }

  String getYesNo(bool prop) => prop ? 'Yes' : 'No';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    final cartStore = context.read<CartStore>();

    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;

    void addToCart() {
      final CartItem item = CartItem(meal: meal, ammount: ammount);
      cartStore.addToCart(item);
      Navigator.of(context).pushNamed(AppRoutes.cart.name);
    }

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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cook your meal at home!',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MealRecipe(meal: meal)
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(builder: (context) {
        final mealStore = context.watch<MealStore>();

        return FloatingActionButton(
          backgroundColor: colorScheme.onPrimaryContainer,
          onPressed: () => mealStore.toggleFavoriteMeal(meal),
          child: Icon(
            mealStore.isFavorite(meal)
                ? Icons.star
                : Icons.star_outline_outlined,
            color: colorScheme.onInverseSurface,
          ),
        );
      }),
      bottomNavigationBar: Container(
        height: 75,
        color: colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.black,
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: removeOne,
                          icon: const Icon(Icons.remove),
                        ),
                        Text(
                          ammount.toString(),
                          style: textTheme.labelLarge,
                        ),
                        IconButton(
                          onPressed: addOne,
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: MaterialButton(
                    onPressed: () => addToCart(),
                    color: colorScheme.primary,
                    textColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Add',
                          style: textTheme.labelMedium,
                        ),
                        if (ammount > 0)
                          Text(
                              'U\$  ${(meal.price * ammount).toStringAsFixed(2)}')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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

class MealRecipe extends StatelessWidget {
  const MealRecipe({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
              child: UniversalScroll(
                child: ListView(
                  shrinkWrap: true,
                  children: meal.recipe.steps
                      .map((step) => ListTile(
                            title: Text(step.toString()),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
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
              child: UniversalScroll(
                child: ListView(
                  shrinkWrap: true,
                  children: getMealBadges,
                ),
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: colorScheme.outline, width: 1)),
      child: ListTile(
        leading: SizedBox(
          width: 100,
          height: itemHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(label)],
          ),
        ),
        trailing: SizedBox(
          height: itemHeight,
          width: 100,
          child: Center(
            child: Text(data),
          ),
        ),
      ),
    );
  }
}
