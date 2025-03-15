import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final FontWeight weight;

  const TextUtil({
    super.key,
    required this.text,
    this.color = Colors.white,
    this.size = 16,
    this.weight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
