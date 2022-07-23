import 'package:flutter/material.dart';
import 'package:projeto/api/login_api.dart';
import 'package:projeto/screens/home.dart';

import '../api/token.dart';
import '../components/input_field.dart';

const String appBarTitle = "Login";

const String loginButtonTitle = "Login";
const String passwordLabelText = "Password";
const String loginLabelText = "Login";

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginApi _loginApi = LoginApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          InputField(
            labelController: _loginController,
            labelText: loginLabelText,
            secret: false,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          ),
          InputField(
            labelController: _passwordController,
            labelText: passwordLabelText,
            secret: true,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          ),
          ElevatedButton(
            onPressed: () {
              String login = _loginController.text;
              String password = _passwordController.text;
              Future<Token> futureToken = _loginApi.makeLogin(login, password);
              futureToken.then(
                (value) => {
                  if (value.token == "NaN")
                    {
                      setState(() {
                        debugPrint("NÃO CHEGOU!");
                        debugPrint(password);
                      }),
                    }
                  else
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Home();
                          },
                          settings: RouteSettings(arguments: value),
                        ),
                      )
                    }
                },
              );
            },
            child: const Text(loginButtonTitle),
          )
        ],
      ),
    );
  }
}
