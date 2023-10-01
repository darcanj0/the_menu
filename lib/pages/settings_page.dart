import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/models/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage(
      {required this.onSettingsChanged, required this.settings, super.key});

  static const double sectionPaddingInPx = 20;

  final void Function(Settings) onSettingsChanged;

  final Settings settings;

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
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(widget.settings);
        },
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
                value: widget.settings.isGlutenFree,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isGlutenFree = value;
                  });
                },
              ),
              createSwitch(
                  title: 'Lactose Free',
                  subtitle: 'Only display Lactose Free meals',
                  value: widget.settings.isDairyFree,
                  onChanged: (value) {
                    setState(() {
                      widget.settings.isDairyFree = value;
                    });
                  }),
              createSwitch(
                  title: 'Vegan',
                  subtitle: 'Only display vegan meals',
                  value: widget.settings.isVegan,
                  onChanged: (value) {
                    setState(() {
                      widget.settings.isVegan = value;
                    });
                  }),
              createSwitch(
                title: 'Vegetarian',
                subtitle: 'Only display veggie meals',
                value: widget.settings.isVeggie,
                onChanged: (value) {
                  setState(() {
                    widget.settings.isVeggie = value;
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
