import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String inputHint;
  const CustomTextField({super.key, required this.inputHint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: inputHint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
