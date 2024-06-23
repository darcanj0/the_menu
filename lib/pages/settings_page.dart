import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/stores/meal.store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const double sectionPaddingInPx = 20;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    Widget createSwitch({
      required String title,
      required String subtitle,
      required bool value,
      required void Function(bool) onChanged,
    }) {
      return SwitchListTile.adaptive(
        title: Text(
          title,
          style: textTheme.labelLarge,
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
      );
    }

    final mealStore = context.watch<MealStore>();
    final currentFilter = mealStore.mealFilters;

    return Scaffold(
      appBar: const TheMenuAppBar(title: 'Settings'),
      body: Column(
        children: [
          const SizedBox(
            height: SettingsPage.sectionPaddingInPx,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: SettingsPage.sectionPaddingInPx),
                child: Text(
                  'Filters',
                  style: textTheme.headlineLarge,
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView(
            children: [
              createSwitch(
                title: 'Gluten Free',
                subtitle: 'Only display Gluten Free meals',
                value: currentFilter.isGlutenFree,
                onChanged: (value) {
                  final newFilter = currentFilter.copyWith(isGlutenFree: value);
                  mealStore.onFilterChanged(newFilter);
                },
              ),
              createSwitch(
                  title: 'Lactose Free',
                  subtitle: 'Only display Lactose Free meals',
                  value: currentFilter.isDairyFree,
                  onChanged: (value) {
                    final newFilter =
                        currentFilter.copyWith(isDairyFree: value);
                    mealStore.onFilterChanged(newFilter);
                  }),
              createSwitch(
                  title: 'Vegan',
                  subtitle: 'Only display vegan meals',
                  value: currentFilter.isVegan,
                  onChanged: (value) {
                    final newFilter = currentFilter.copyWith(isVegan: value);
                    mealStore.onFilterChanged(newFilter);
                  }),
              createSwitch(
                title: 'Vegetarian',
                subtitle: 'Only display veggie meals',
                value: currentFilter.isVeggie,
                onChanged: (value) {
                  final newFilter = currentFilter.copyWith(isVeggie: value);
                  mealStore.onFilterChanged(newFilter);
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
