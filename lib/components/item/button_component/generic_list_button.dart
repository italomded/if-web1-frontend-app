import 'package:flutter/material.dart';
import 'package:projeto/screens/lists/generic_list.dart';

class GenericListButton extends StatelessWidget {
  final GenericList genericList;
  final String serviceChildName;

  const GenericListButton(
      {Key? key, required this.genericList, required this.serviceChildName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return genericList;
            },
          ),
        );
      },
      child: Text(serviceChildName),
    );
  }
}
