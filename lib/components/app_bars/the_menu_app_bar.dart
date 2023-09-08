import 'package:flutter/material.dart';

class TheMenuAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TheMenuAppBar({super.key});

  @override
  State<StatefulWidget> createState() => _TheMenuAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(45);
}

class _TheMenuAppBarState extends State<TheMenuAppBar> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        "The Menu",
        style: textTheme.headlineLarge,
      ),
      centerTitle: true,
    );
  }
}
