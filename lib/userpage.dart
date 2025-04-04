import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String username;

  const UserPage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome, $username")),
      body: Center(child: Text("You are logged in!")),
    );
  }
}
