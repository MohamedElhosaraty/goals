import 'package:flutter/material.dart';

class CreateTextFormField extends StatelessWidget {
  const CreateTextFormField(
      {
        super.key,
        required this.controller,
        required this.text,
      });

  final TextEditingController controller;

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          label: Text(text),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          contentPadding: const EdgeInsets.all(10)),
    );
  }
}
