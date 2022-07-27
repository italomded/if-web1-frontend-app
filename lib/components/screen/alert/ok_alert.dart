import 'package:flutter/src/widgets/text.dart';
import 'package:projeto/components/screen/alert/alert_chain.dart';

class OkAlert extends AlertChain {
  OkAlert({required super.nextAlert, required super.context});

  @override
  List<Text> alert(List<String> arguments) {
    return [
      const Text("Operação realizada com sucesso!"),
    ];
  }

  @override
  String get statusCode => "200";
}
