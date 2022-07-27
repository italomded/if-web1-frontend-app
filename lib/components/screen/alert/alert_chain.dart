import 'package:flutter/material.dart';

abstract class AlertChain {
  final AlertChain? nextAlert;
  final BuildContext context;
  abstract final String statusCode;

  AlertChain({required this.nextAlert, required this.context});

  Future<void> show(List<Widget> message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Aviso'),
          content: SingleChildScrollView(
            child: ListBody(
              children: message,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void doAction(List<String> arguments) {
    if (arguments.first == statusCode) {
      show(alert(arguments));
      return;
    }
    nextAlert!.doAction(arguments);
  }

  List<Text> alert(List<String> arguments);
}
