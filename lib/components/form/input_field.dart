import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController labelController;
  final bool secret;
  final EdgeInsetsGeometry padding;

  const InputField({
    Key? key,
    required this.labelController,
    required this.labelText,
    required this.secret,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(Object context) {
    return Padding(
        padding: padding,
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          obscureText: secret,
          controller: labelController,
        ));
  }
}
