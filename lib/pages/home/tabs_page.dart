import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/pages/home/categories_tab.dart';
import 'package:the_menu/pages/home/favorites_tab.dart';

import '../../components/buttons/cart_float_button.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _tabs = [
    const CategoriesTab(),
    const FavoritesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
        appBar: const TheMenuAppBar(title: 'The Menu'),
        body: _tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: colorScheme.inversePrimary,
            onTap: _selectPage,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                  label: 'Favorites',
                  icon: Icon(
                    Icons.star,
                  )),
            ]),
        floatingActionButton: const CartFloatButton());
  }
}
