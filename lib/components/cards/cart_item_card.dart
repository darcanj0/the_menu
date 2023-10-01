import 'package:flutter/material.dart';
import 'package:the_menu/models/cart.dart';
import 'package:the_menu/utils/routes.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  const CartItemCard(
      {required this.cartItem,
      required this.onRemove,
      required this.onChangeAmmount,
      super.key});

  static const double cardOuterPadding = 2.5;
  static const double cardBorderRadius = 5;

  final void Function(CartItem) onRemove;
  final void Function(CartItem, int) onChangeAmmount;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.mealDetails.name, arguments: widget.cartItem.meal);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: CartItemCard.cardOuterPadding),
      child: ListTile(
        tileColor: colorScheme.primaryContainer,
        title: Text(
          widget.cartItem.meal.name,
          style: textTheme.labelLarge,
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => widget.onChangeAmmount(
                  widget.cartItem, widget.cartItem.ammount - 1),
              icon: const Icon(Icons.remove),
            ),
            Text(
              widget.cartItem.ammount.toString(),
              style: textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () => widget.onChangeAmmount(
                  widget.cartItem, widget.cartItem.ammount + 1),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => widget.onRemove(widget.cartItem),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(CartItemCard.cardBorderRadius)),
        leading: InkWell(
          onTap: () => selectMeal(context),
          child: Ink(
            height: 200,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.cartItem.meal.imagePath),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
