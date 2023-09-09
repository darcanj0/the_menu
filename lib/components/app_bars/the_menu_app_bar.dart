import 'package:flutter/material.dart';

class TheMenuAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const TheMenuAppBar({required this.title, super.key});

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
      title: FittedBox(
        child: Text(
          widget.title,
          style: textTheme.headlineLarge,
        ),
      ),
      centerTitle: true,
    );
  }
}
