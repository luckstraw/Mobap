import 'package:flutter/material.dart';
import '../models/product.dart';

class CartService with ChangeNotifier {
  final List<Product> _cart = [];

  List<Product> get items => _cart;

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
