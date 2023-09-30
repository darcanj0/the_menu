import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static double sectionPaddingInPx = 20;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Settings settings = Settings(
    isGlutenFree: false,
    isLactoseFree: false,
    isVegan: false,
    isVeggie: false,
  );

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

    return Scaffold(
      appBar: const TheMenuAppBar(title: 'Settings'),
      body: Column(
        children: [
          SizedBox(
            height: SettingsPage.sectionPaddingInPx,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
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
                value: settings.isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    settings.isGlutenFree = value;
                  });
                },
              ),
              createSwitch(
                  title: 'Lactose Free',
                  subtitle: 'Only display Lactose Free meals',
                  value: settings.isLactoseFree,
                  onChanged: (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  }),
              createSwitch(
                  title: 'Vegan',
                  subtitle: 'Only display vegan meals',
                  value: settings.isVegan,
                  onChanged: (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  }),
              createSwitch(
                title: 'Vegetarian',
                subtitle: 'Only display veggie meals',
                value: settings.isVeggie,
                onChanged: (value) {
                  setState(() {
                    settings.isVeggie = value;
                  });
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}
