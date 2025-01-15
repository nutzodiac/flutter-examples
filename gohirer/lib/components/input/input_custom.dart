import 'package:flutter/material.dart';

class MyInputCustom extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? forceErrorText;
  final String? Function(String?) validator;
  final Function(String) onChanged;

  const MyInputCustom({
    super.key,
    required this.controller,
    this.hintText,
    this.forceErrorText,
    required this.validator,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            blurRadius: 6,
            spreadRadius: 2,
            blurStyle: BlurStyle.solid
          )
        ]
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.orange),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          hintText: hintText,
          errorText: forceErrorText
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}