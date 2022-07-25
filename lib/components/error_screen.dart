import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50.0),
          const Divider(),
          Column(
            children: const [
              Text(
                  "Oops! Ocorreu um erro, provavelmente aconteceu uma das seguintes coisas:"),
              Divider(),
              Text(
                  "1. Suas credenciais de acesso não são suficientes para tal ação;"),
              Text(
                  "2. Suas credenciais expiraram; Neste caso, faça logout e login novamente;"),
            ],
          ),
        ],
      ),
    );
  }
}
