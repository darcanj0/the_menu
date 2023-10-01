import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({required this.imageWidth, super.key});

  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
            width: imageWidth,
            fit: BoxFit.cover,
            image: const AssetImage('assets/images/meals/empty_cart.png')),
        const SizedBox(
          height: 20,
        ),
        Text(
          'No meals here',
          style: textTheme.labelLarge,
        ),
        const Text("Go and add items to your cart!")
      ],
    );
  }
}
