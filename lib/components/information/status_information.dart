import 'package:flutter/material.dart';

class StatusInformation extends StatelessWidget {
  final bool status;

  const StatusInformation({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Flexible(child: Icon(Icons.bolt)),
        Flexible(
            child: Text("Status: ${status == true ? "Active" : "Inactive"}")),
      ],
    );
  }
}
