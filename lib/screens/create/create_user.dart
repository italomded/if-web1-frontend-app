import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/endpoint/profile_endpoint.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/endpoint/user_endpoint.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Create user";
const String userNameLabelText = "Name";
const String userLoginLabelText = "Login";
const String userPasswordLabelText = "Password";
const String createButtonText = "Create resource";

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateUserState();
  }
}

class _CreateUserState extends State<CreateUser> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userLoginController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();
  final Endpoint _endpoint = UserEndpoint();
  late NotificationAlert _notification;
  late Token _token;

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      _token = ModalRoute.of(context)!.settings.arguments as Token;
    } else {
      _token = Token(token: 'NaN', type: 'NaN');
    }
    _notification = NotificationAlert(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          InputField(
            labelController: _userNameController,
            labelText: userNameLabelText,
            secret: false,
            padding: PatternMeasures.inputFieldPaddingPattern,
          ),
          InputField(
            labelController: _userLoginController,
            labelText: userLoginLabelText,
            secret: false,
            padding: PatternMeasures.middleInputFieldPaddingPattern,
          ),
          InputField(
            labelController: _userPasswordController,
            labelText: userPasswordLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              String userName = _userNameController.text;
              String userLogin = _userLoginController.text;
              String userPassword = _userPasswordController.text;
              Map<String, String> data = {
                'name': userName,
                'login': userLogin,
                'password': userPassword,
              };
              Future<List<String>> futureResponse =
                  _endpoint.create(_token, data);
              futureResponse.then(
                (value) => {
                  _notification.process(value),
                },
              );
            },
            child: const Text(createButtonText),
          )
        ],
      ),
    );
  }
}
