import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class BadCredentialsAlert extends AlertChain {
  BadCredentialsAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text("Oops! Ocorreu um erro:"),
      const Text("- Suas credenciais estão incorretas ou são invalidas;"),
    ];
  }

  @override
  String get statusCode => "401";
}
