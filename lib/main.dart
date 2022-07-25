import 'package:flutter/material.dart';
import 'package:projeto/screens/login.dart';

const String appName = "Projeto";

void main() {
  runApp(const Project());
}

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        fontFamily: 'Georgia',
      ),
      home: const Login(),
    );
  }
}
