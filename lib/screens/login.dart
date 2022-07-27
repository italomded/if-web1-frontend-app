import 'package:flutter/material.dart';
import 'package:projeto/api/login_api.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import 'package:projeto/measures/pattern_measures.dart';
import 'package:projeto/screens/create/create_user.dart';
import 'package:projeto/screens/home.dart';

import '../api/token.dart';
import '../components/form/input_field.dart';

const String appBarTitle = "Login";

const String createAccountButtonTitle = "Create account";
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
  late NotificationAlert _notificationAlert;

  @override
  Widget build(BuildContext context) {
    _notificationAlert = NotificationAlert(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
          child: Column(
            children: [
              InputField(
                labelController: _loginController,
                labelText: loginLabelText,
                secret: false,
                padding: PatternMeasures.inputFieldPaddingPattern,
              ),
              InputField(
                labelController: _passwordController,
                labelText: passwordLabelText,
                secret: true,
                padding: PatternMeasures.lastInputFieldPaddingPattern,
              ),
              LoginButton(
                loginApi: _loginApi,
                loginController: _loginController,
                passwordController: _passwordController,
                notificationAlert: _notificationAlert,
              ),
              const CreateAccountButton(),
            ],
          ),
          onWillPop: () async => false),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text(createAccountButtonTitle),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CreateUser();
            },
          ),
        );
      },
    );
  }
}

class LoginButton extends StatelessWidget {
  final TextEditingController loginController;
  final TextEditingController passwordController;
  final LoginApi loginApi;
  final String loginButtonTitle = "Login";
  final NotificationAlert notificationAlert;

  const LoginButton(
      {Key? key,
      required this.loginController,
      required this.passwordController,
      required this.loginApi,
      required this.notificationAlert})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String login = loginController.text;
        String password = passwordController.text;
        Future<List<String>> futureToken = loginApi.makeLogin(login, password);
        futureToken.then(
          (value) => {
            if (value.first == "200")
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Home();
                    },
                    settings: RouteSettings(
                        arguments: Token(token: value[1], type: value[2])),
                  ),
                )
              }
            else
              {
                notificationAlert.process(value),
              }
          },
        );
      },
      child: Text(loginButtonTitle),
    );
  }
}
