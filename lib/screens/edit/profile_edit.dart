import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/profile_endpoint.dart';
import 'package:projeto/api/token.dart';
import 'package:projeto/components/form/input_field.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import 'package:projeto/measures/pattern_measures.dart';

const String appBarTitle = "Profile edit";

const String profileLabel = "Profile ID";
const String userAndTransactionLabel = "User or transaction ID";

const String addUserLabel = "Add user";
const String removeUserLabel = "Remove user";

const String addTransactionLabel = "Add transaction";
const String removeTransactionLabel = "Remove transaction";

const String explainScreenText =
    "Here you cand remove and add transaction or users to profile in the samme screen.";

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProfileEditState();
  }
}

class _ProfileEditState extends State<ProfileEdit> {
  final ProfileEndpoint _profileEndpoint = ProfileEndpoint();
  final TextEditingController _profileIdController = TextEditingController();
  final TextEditingController _otherResourceIdController =
      TextEditingController();
  late NotificationAlert notification;

  @override
  Widget build(BuildContext context) {
    Token token = ModalRoute.of(context)!.settings.arguments as Token;
    notification = NotificationAlert(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: PatternMeasures.inputFieldPaddingPattern,
            child: const Text(explainScreenText),
          ),
          InputField(
            labelController: _profileIdController,
            labelText: profileLabel,
            secret: false,
            padding: PatternMeasures.inputFieldPaddingPattern,
          ),
          InputField(
            labelController: _otherResourceIdController,
            labelText: userAndTransactionLabel,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {
                      Future<List<String>> response =
                          _profileEndpoint.removeUser(token, getForUserData());
                      response.then(
                        (value) => {
                          notification.process(value),
                        },
                      );
                    },
                    child: const Text(removeUserLabel),
                  )),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    Future<List<String>> response =
                        _profileEndpoint.addUser(token, getForUserData());
                    response.then(
                      (value) => {
                        notification.process(value),
                      },
                    );
                  },
                  child: const Text(addUserLabel),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    Future<List<String>> response =
                        _profileEndpoint.removeTransaction(
                      token,
                      getForTransactionData(),
                    );
                    response.then(
                      (value) => {
                        notification.process(value),
                      },
                    );
                  },
                  child: const Text(removeTransactionLabel),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {
                    Future<List<String>> response =
                        _profileEndpoint.addTransaction(
                      token,
                      getForTransactionData(),
                    );
                    response.then(
                      (value) => {
                        notification.process(value),
                      },
                    );
                  },
                  child: const Text(addTransactionLabel),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Map<String, String> getForUserData() {
    return {
      'profileId': _profileIdController.text,
      'userId': _otherResourceIdController.text
    };
  }

  Map<String, String> getForTransactionData() {
    return {
      'profileId': _profileIdController.text,
      'transactionId': _otherResourceIdController.text
    };
  }
}
