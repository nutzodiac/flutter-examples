import 'package:flutter/material.dart';

class MyTextButtonCustom extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const MyTextButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 16, decoration: TextDecoration.underline),),
    );
  }
}