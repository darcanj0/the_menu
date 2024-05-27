import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';
import 'package:the_menu/components/buttons/checkout_float_button.dart';
import 'package:the_menu/components/cards/cart_item_card.dart';
import 'package:the_menu/components/helpers/empty_cart.dart';
import 'package:the_menu/models/cart.dart';
import 'package:the_menu/utils/universal_scroll.dart';

class CartPage extends StatefulWidget {
  const CartPage(
      {required this.cart,
      required this.onRemove,
      required this.onChangeAmmount,
      super.key});

  final Cart cart;

  final void Function(CartItem) onRemove;
  final void Function(CartItem, int) onChangeAmmount;

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      appBar: const TheMenuAppBar(title: 'Cart'),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: LayoutBuilder(
          builder: (context, constraints) => widget.cart.items.isEmpty
              ? Center(
                  child: EmptyCart(
                    imageWidth: constraints.maxHeight * 0.6,
                  ),
                )
              : SizedBox(
                  width: constraints.maxWidth,
                  child: UniversalScroll(
                    child: ListView.builder(
                      itemCount: widget.cart.items.length,
                      itemBuilder: (ctx, index) => CartItemCard(
                        cartItem: widget.cart.items[index],
                        onRemove: widget.onRemove,
                        onChangeAmmount: widget.onChangeAmmount,
                      ),
                    ),
                  ),
                ),
        ),
      ),
      floatingActionButton: widget.cart.items.isEmpty
          ? const SizedBox()
          : const CheckoutFloatButton(),
      bottomNavigationBar: Container(
        height: 75,
        color: colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Flexible(flex: 2, child: SizedBox()),
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: colorScheme.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Subtotal',
                          style: textTheme.labelLarge!
                              .copyWith(color: colorScheme.background),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'U\$  ${(widget.cart.total).toStringAsFixed(2)}',
                          style: textTheme.headlineLarge!
                              .copyWith(color: colorScheme.background),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
