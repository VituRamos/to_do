import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TaskButton extends StatelessWidget {
const TaskButton({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}