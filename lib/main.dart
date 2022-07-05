import 'package:flutter/material.dart';
import 'package:projeto/screens/home.dart';

void main() {
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
