import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class UnauthorizedAlert extends AlertChain {
  UnauthorizedAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text(
          "Oops! Ocorreu um erro, provavelmente aconteceu uma das seguintes coisas:"),
      const Text(
          "1. Suas credenciais expiraram; Neste caso, faça logout e login novamente;"),
      const Text("2. Você não possui credencias de acesso necessárias;"),
    ];
  }

  @override
  String get statusCode => "403";
}
