import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  late Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get cartItemCount {
    return _cartItems.length;
  }

  double get totalAmount {
    double total = 0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addCartItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
        productId,
        (existing) => CartItem(
            id: productId,
            title: title,
            quantity: existing.quantity + 1,
            price: price),
      );
    } else {
      _cartItems.putIfAbsent(
        productId,
        () => CartItem(id: productId, title: title, quantity: 1, price: price),
      );
    }
    notifyListeners();
  }

  void removeCartItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
