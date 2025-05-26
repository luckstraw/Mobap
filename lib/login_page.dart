import 'package:flutter/material.dart';
import 'api_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = "";
  void handleLogin() async {
    String result = await ApiService.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    setState(() => message = result);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: emailController, decoration:
            InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration:
            InputDecoration(labelText: "Password"), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: handleLogin, child: Text("Login")),
            SizedBox(height: 20),
            Text(message, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}