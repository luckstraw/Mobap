import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String username;

  const UserPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/img/welcome_BG2.jpg', // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Curved Top Shape
          Positioned(
            top: -80,
            left: -50,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 0, 0, 255),
              ),
            ),
          ),

          // Curved Bottom Shape
          Positioned(
            bottom: -120,
            right: -80,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 128, 0, 128),
              ),
            ),
          ),

          // Welcome Message
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),
                _buildButton("Logout", Colors.red, () {
                  Navigator.pop(context); // Go back to the login screen
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom ElevatedButton
  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          elevation: 8,
        ),
        child: Text(text),
      ),
    );
  }
}
