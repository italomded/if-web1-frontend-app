import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class ConflictAlert extends AlertChain {
  ConflictAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text("Oops! Ocorreu um erro:"),
      const Text("1. Um recurso com características semelhantes já existe;"),
    ];
  }

  @override
  String get statusCode => "409";
}
