import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? "Login" : "Signup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
          TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password"), obscureText: true),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              if (isLogin) {
                await auth.signIn(emailController.text, passwordController.text);
              } else {
                await auth.signUp(emailController.text, passwordController.text);
              }
              
              // Ensure widget is still mounted before using context
              if (mounted) {
                
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            child: Text(isLogin ? "Login" : "Signup"),
          ),

          TextButton(
            onPressed: () => setState(() => isLogin = !isLogin),
            child: Text(isLogin ? "Create an account" : "Already have an account? Login"),
          )
        ]),
      ),
    );
  }
}
