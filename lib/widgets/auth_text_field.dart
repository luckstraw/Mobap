import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
    );
  }
}
