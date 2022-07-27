import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class ErrorAlert extends AlertChain {
  ErrorAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    arguments.remove("400");
    return [
      const Text("Oops! Ocorreu um erro:"),
      for (var i in arguments) Text("- $i"),
    ];
  }

  @override
  String get statusCode => "400";
}
