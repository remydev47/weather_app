import 'package:flutter/material.dart';

class Subscript extends StatelessWidget {
  const Subscript(
      {super.key,
      required this.text,
      required this.superScript,
      required this.color,
      required this.superscriptColor});

  final String text;
  final String superScript;
  final Color color;
  final Color superscriptColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          superScript,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
