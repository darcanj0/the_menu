import 'package:flutter/material.dart';
import 'package:the_menu/utils/routes.dart';

class TheMenuDrawer extends StatelessWidget {
  const TheMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    void navigateTo(AppRoutes route) =>
        Navigator.of(context).pushNamed(route.name);

    void navigateToPoppingCurrent(AppRoutes route) =>
        Navigator.of(context).pushReplacementNamed(route.name);

    Widget getTile(IconData icon, String label, void Function() fn) {
      return ListTile(
        leading: Icon(icon, size: 24),
        title: Text(
          label,
          style: textTheme.titleMedium,
        ),
        onTap: fn,
      );
    }

    return Drawer(
        child: Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          color: colorScheme.onPrimaryContainer,
          child: Center(
            child: Text(
              'The Menu',
              style: textTheme.headlineMedium,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        getTile(Icons.home, 'Home',
            () => navigateToPoppingCurrent(AppRoutes.categories)),
        getTile(Icons.restaurant, 'All Meals',
            () => navigateTo(AppRoutes.allMeals)),
        getTile(Icons.shopping_cart, 'Cart', () => navigateTo(AppRoutes.cart)),
        getTile(
            Icons.settings, 'Settings', () => navigateTo(AppRoutes.settings))
      ],
    ));
  }
}
