import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image (Change to your asset path)
          Positioned.fill(
            child: Opacity(
              opacity: 0.7, // Dark overlay effect
              child: Image.asset(
                'assets/img/welcome_BG2.jpg', // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Curved Shape at the top
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 0, 0, 255),
              ),
            ),
          ),

          // Curved Shape at the bottom
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 128, 0, 128),
              ),
            ),
          ),

          // Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                _buildButton(context, "Login", Colors.black, Colors.blue, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
                const SizedBox(height: 15),
                _buildButton(context, "Sign Up", Colors.black, Colors.purple, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color textColor, Color bgColor, VoidCallback onPressed) {
    return SizedBox(
      width: 220,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          elevation: 8,
        ),
        child: Text(text),
      ),
    );
  }
}
