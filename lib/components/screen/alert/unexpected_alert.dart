import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class UnexpectedAlert extends AlertChain {
  UnexpectedAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text("Oops! Ocorreu um erro inesperado!"),
    ];
  }

  @override
  void doAction(List<String> arguments) {
    show(alert(arguments));
  }

  @override
  String get statusCode => throw UnimplementedError();
}
