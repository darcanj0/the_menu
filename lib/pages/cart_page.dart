import 'package:flutter/material.dart';
import 'package:the_menu/components/app_bars/the_menu_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<StatefulWidget> createState() => CartPageState();
}

class CartPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TheMenuAppBar(title: 'Cart'),
      body: Center(
        child: Text('Cart'),
      ),
    );
  }
}
