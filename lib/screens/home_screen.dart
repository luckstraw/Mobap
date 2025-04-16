import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../services/auth_service.dart';
import '../services/product_service.dart';
import '../services/cart_service.dart';
import '../models/product.dart';
import 'login_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  final ProductService productService = ProductService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context, listen: false);
    final cart = Provider.of<CartService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          if (auth.user != null) ...[
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CartScreen()));
              },
              child: const Text(
                "Cart",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            TextButton(
              onPressed: () => auth.signOut(),
              child: const Text(
                "Logout",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              ),
            ),
          ] else
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
              child: const Text(
                "Login",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
      body: StreamBuilder<List<Product>>(
        stream: productService.getProducts(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final products = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];

              return GlassmorphicContainer(
  width: double.infinity,
  height: double.infinity,
  borderRadius: 16,
  blur: 15,
  alignment: Alignment.center,
  border: 1,
  // Glass-like gradient background
  linearGradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withValues(alpha: (0.1 * 255).toDouble()),
      Colors.white.withValues(alpha: (0.05 * 255).toDouble()),
    ],
  ),
  // Gradient border for a subtle shine effect
  borderGradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.white.withValues(alpha: (0.5 * 255).toDouble()),
      Colors.white.withValues(alpha: (0.5 * 255).toDouble()),
    ],
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Product Image
      ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        child: Image.network(
          product.imageUrl,
          height: 120,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 120,
            color: Colors.grey[200],
            child: const Icon(Icons.image_not_supported, size: 40),
          ),
        ),
      ),
      // Use Expanded so that the details section fits within the remaining space
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Product Details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // Product Price
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  // Product Description
                  Text(
                    product.description,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              // Add to Cart Button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    if (auth.user == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Please login to add to cart")),
                      );
                    } else {
                      cart.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Added to cart")),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                        .withValues(alpha: (0.1 * 255).toDouble()),
                  ),
                  child: const Text("Add to Cart",
                      style:
                          TextStyle(color: Colors.blueAccent, fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);

            },
          );
        },
      ),
    );
  }
}
