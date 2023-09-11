import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TheMenuAppBar(title: 'Settings'),
      body: Center(
        child: Text('Settings'),
      ),
    );
  }
}
