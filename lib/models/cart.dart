import 'package:the_menu/models/meal.dart';

class Cart {
  final List<CartItem> items;

  Cart({required this.items});

  double get total => items
      .map((item) => item.total)
      .fold(0, (previousValue, element) => previousValue + element);

  void addItem(CartItem item) {
    final String mealId = item.meal.id;
    Iterable<CartItem> alreadyInCart =
        items.where((element) => element.meal.id == mealId);

    if (alreadyInCart.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      alreadyInCart.forEach((element) => element.ammount = item.ammount);
      return;
    }

    items.add(item);
  }

  void removeItem(CartItem item) {
    items.removeWhere((element) => element.meal.id == item.meal.id);
  }

  void changeAmmount(CartItem item, int newAmmount) {
    if (newAmmount <= 0) return removeItem(item);
    items
        .where((element) => item.meal.id == element.meal.id)
        .forEach((element) => element.changeAmmount = newAmmount);
  }
}

class CartItem {
  final Meal meal;
  int ammount;

  CartItem({required this.meal, required this.ammount});

  double get total => meal.price * ammount;

  set changeAmmount(int newAmmount) {
    ammount = newAmmount;
  }
}
