import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'userpage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";

  @override
  void dispose() {
    // Dispose controllers to free up resources
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> signup() async {
    try {
      var url = Uri.parse("http://192.168.1.19/backend/server/signup.php");
      var response = await http.post(url, body: {
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      });

      var data = json.decode(response.body);

      if (!mounted) return; // Ensure widget is still in widget tree

      if (data["status"] == "success") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UserPage(username: usernameController.text)),
        );
      } else {
        setState(() {
          message = data["message"];
        });
      }
    } catch (e) {
      setState(() {
        message = "An error occurred.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: signup,
              child: const Text("Sign Up"),
            ),
            Text(
              message,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
