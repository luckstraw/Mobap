import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';
import '../widgets/auth_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/img/welcome_BG2.jpg', // Replace with your image path
            fit: BoxFit.cover,
          ),
          Container(
            color: const Color.fromARGB(128, 0, 0, 0), // 128 = 50% opacity in ARGB
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 48, // Increased font size for more prominence
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
              const SizedBox(height: 30), // More space between title and buttons
              AuthButton(
                text: "Login",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                  );
                },
              ),
              const SizedBox(height: 15), // Adjusted spacing between buttons
              AuthButton(
                text: "Sign Up",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
