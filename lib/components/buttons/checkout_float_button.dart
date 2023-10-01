import 'package:flutter/material.dart';

class CheckoutFloatButton extends StatelessWidget {
  const CheckoutFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return FloatingActionButton.extended(
      onPressed: () => {},
      label: Text(
        'Proceed to checkout',
        style: textTheme.labelLarge,
      ),
      icon: const Icon(
        Icons.keyboard_arrow_right,
      ),
    );
  }
}
