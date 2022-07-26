import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController labelController;
  final bool secret;
  final EdgeInsetsGeometry padding;
  final IconData? icon;

  const InputField(
      {Key? key,
      required this.labelController,
      required this.labelText,
      required this.secret,
      required this.padding,
      this.icon})
      : super(key: key);

  @override
  Widget build(Object context) {
    return Padding(
        padding: padding,
        child: TextField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            icon: icon != null ? Icon(icon) : null,
          ),
          obscureText: secret,
          controller: labelController,
        ));
  }
}
