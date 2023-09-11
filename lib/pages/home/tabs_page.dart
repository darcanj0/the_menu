import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/components/app_bars/the_menu_drawer.dart';
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

  final List<Map<String, Object>> _tabs = [
    {'tab': const CategoriesTab(), 'appBarTitle': 'Categories'},
    {'tab': const FavoritesTab(), 'appBarTitle': 'Favorites'},
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
        appBar: TheMenuAppBar(
            title: _tabs[_selectedIndex]['appBarTitle'] as String),
        drawer: const TheMenuDrawer(),
        body: _tabs[_selectedIndex]['tab'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: colorScheme.inversePrimary,
            onTap: _selectPage,
            currentIndex: _selectedIndex,
            selectedFontSize: 15,
            unselectedFontSize: 13,
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
