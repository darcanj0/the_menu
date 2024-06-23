import 'package:flutter/material.dart';
import 'package:the_menu/models/cart.dart';

class CartStore with ChangeNotifier {
  final _cart = Cart.empty();

  void addToCart(CartItem item) {
    _cart.addItem(item);
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cart.removeItem(item);
    notifyListeners();
  }

  void changeItemAmmount(CartItem item, int newAmmount) {
    _cart.changeAmmount(item, newAmmount);
    notifyListeners();
  }

  List<CartItem> get items => [..._cart.items];

  double get total => _cart.total;
}
