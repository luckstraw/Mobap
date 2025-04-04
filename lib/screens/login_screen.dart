import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_button.dart';
import 'user_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = "";
  bool isLoading = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    var data = await AuthService.login(emailController.text, passwordController.text);
    if (!mounted) return;
    setState(() {
      isLoading = false;
    });

    if (data["status"] == "success") {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => UserPage(username: data["username"]),
      ));
    } else {
      setState(() => message = data["message"]);
    }
  }

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
              children: [
                const SizedBox(height: 100), // Space for top
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                AuthTextField(controller: emailController, label: "Email"),
                const SizedBox(height: 20),
                AuthTextField(controller: passwordController, label: "Password", obscureText: true),
                const SizedBox(height: 30),
                if (isLoading)
                  const CircularProgressIndicator() // Loading indicator
                else
                  AuthButton(
                    text: "Login",
                    onPressed: login,
                  ),
                const SizedBox(height: 20),
                if (message.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
