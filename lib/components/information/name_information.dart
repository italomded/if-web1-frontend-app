import 'package:flutter/material.dart';

class NameInformation extends StatelessWidget {
  final String name;

  const NameInformation({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Flexible(child: Icon(Icons.short_text)),
        Flexible(child: Text("Name: $name")),
      ],
    );
  }
}
