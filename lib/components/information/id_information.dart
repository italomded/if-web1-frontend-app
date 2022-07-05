import 'package:flutter/material.dart';

class IdInformation extends StatelessWidget {
  final int id;

  const IdInformation({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Flexible(child: Icon(Icons.key)),
        Flexible(child: Text("Id: $id")),
      ],
    );
  }
}
