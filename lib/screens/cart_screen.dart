import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/cart_service.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartService>(context);
    final items = cart.items;

    double totalPrice = items.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 1,
      ),
      body: items.isEmpty
          ? Center(child: Text("Your cart is empty"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (_, index) {
                final product = items[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product.imageUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Icon(Icons.image, size: 40),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text("\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                        onPressed: () => cart.removeFromCart(product),
                      ),
                    ],
                  ),
                );
              },
            ),
      bottomNavigationBar: items.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 16, color: Colors.blueAccent)),
                    ],
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      cart.clearCart();
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Order placed")));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Place Order", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
