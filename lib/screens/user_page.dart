import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String username;

  const UserPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image or Gradient
          Image.asset(
            'assets/img/welcome_BG2.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color.fromARGB(128, 0, 0, 0), // 128 = 50% opacity in ARGB
          ),
          // Main content
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100), // Space for top
                Text(
                  'Welcome, $username!',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'You are logged in!',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black54,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    // Handle Logout
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Log-out button style
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Log Out'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
