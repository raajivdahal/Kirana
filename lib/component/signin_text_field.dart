import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  const SignInTextField({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        border: const OutlineInputBorder(),
        label: Text(label),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: icon,
      ),
    );
  }
}
