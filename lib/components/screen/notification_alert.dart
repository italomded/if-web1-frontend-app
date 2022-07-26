import 'package:flutter/material.dart';

class NotificationAlert {
  final BuildContext context;

  NotificationAlert({required this.context});

  Future<void> show(List<Widget> message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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

  void error() {
    show(
      <Widget>[
        const Text(
            "Oops! Ocorreu um erro, provavelmente aconteceu uma das seguintes coisas:"),
        const Text("1. Você errou alguma informação;"),
        const Text(
            "2. Suas credenciais expiraram; Neste caso, faça logout e login novamente;"),
        const Text("3. Você não possui credencias de acesso necessárias;"),
      ],
    );
  }

  void sucess() {
    show(
      <Widget>[
        const Text("Operação realizada com sucesso!"),
      ],
    );
  }
}
