import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class CartFloatButton extends StatelessWidget {
  const CartFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void goToCart(BuildContext ctx) {
      Navigator.of(context).pushNamed(AppRoutes.cart.name);
    }

    return FloatingActionButton(
      onPressed: () => goToCart(context),
      child: const Icon(Icons.shopping_cart),
    );
  }
}
