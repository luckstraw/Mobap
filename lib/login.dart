import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'userpage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";

  Future<void> login() async {
    var url = Uri.parse("http://192.168.1.19/backend/server/login.php");
    var response = await http.post(url, body: {
      "email": emailController.text,
      "password": passwordController.text,
    });

    var data = json.decode(response.body);

    if (!mounted) return; // Prevent async errors

    if (data["status"] == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserPage(username: data["username"])),
      );
    } else {
      setState(() {
        message = data["message"];
      });
    }
  }

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
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 0, 0, 255), // Blue with opacity
              ),
            ),
          ),

          // Curved Bottom Shape
          Positioned(
            bottom: -150,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(51, 128, 0, 128), // Purple with opacity
              ),
            ),
          ),

          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(emailController, "Email", Icons.email),
                  const SizedBox(height: 15),
                  _buildTextField(passwordController, "Password", Icons.lock, isPassword: true),
                  const SizedBox(height: 20),
                  _buildButton("Login", Colors.blue, login),
                  const SizedBox(height: 15),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Custom TextField
  Widget _buildTextField(TextEditingController controller, String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // Custom ElevatedButton
  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
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
