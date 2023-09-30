import 'package:flutter/material.dart';

class FavoriteFloatButton extends StatelessWidget {
  const FavoriteFloatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      backgroundColor: colorScheme.onPrimaryContainer,
      onPressed: () {},
      child: Icon(
        Icons.star_outline_outlined,
        color: colorScheme.onInverseSurface,
      ),
    );
  }
}
