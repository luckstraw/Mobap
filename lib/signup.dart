import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'userpage.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String message = "";

  Future<void> signup() async {
    var url = Uri.parse("http://192.168.1.19/backend/server/signup.php");
    var response = await http.post(url, body: {
      "username": usernameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    var data = json.decode(response.body);
    if (data["status"] == "success") {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserPage(username: usernameController.text)));
    } else {
      setState(() {
        message = data["message"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: usernameController, decoration: InputDecoration(labelText: "Username")),
            TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
            ElevatedButton(onPressed: signup, child: Text("Sign Up")),
            Text(message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
