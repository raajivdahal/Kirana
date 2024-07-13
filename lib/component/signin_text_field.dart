import 'package:flutter/material.dart';

class SignInTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  const SignInTextField({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
        ),
        border: OutlineInputBorder(),
        label: Text(label),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: icon,
      ),
    );
  }
}
