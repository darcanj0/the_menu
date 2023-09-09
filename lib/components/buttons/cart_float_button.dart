import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class CartFloatButton extends StatelessWidget {
  const CartFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    void goToCart(BuildContext ctx) {
      Navigator.of(context).pushNamed(AppRoutes.cart.name);
    }

    return FloatingActionButton(
      backgroundColor: colorScheme.onPrimaryContainer,
      onPressed: () => goToCart(context),
      child: Icon(
        Icons.shopping_cart,
        color: colorScheme.onInverseSurface,
      ),
    );
  }
}
