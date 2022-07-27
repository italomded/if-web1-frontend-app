import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class CreatedAlert extends AlertChain {
  CreatedAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text("Recurso criado com sucesso!"),
    ];
  }

  @override
  String get statusCode => "201";
}
