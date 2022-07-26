import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/endpoint/profile_endpoint.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Create profile";
const String profileNameLabelText = "Name";
const String createButtonText = "Create resource";

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateProfileState();
  }
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _profileNameController = TextEditingController();
  final Endpoint _endpoint = ProfileEndpoint();
  late NotificationAlert _notification;
  late Token token;

  @override
  Widget build(BuildContext context) {
    token = ModalRoute.of(context)!.settings.arguments as Token;
    _notification = NotificationAlert(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
      ),
      body: Column(
        children: [
          InputField(
            labelController: _profileNameController,
            labelText: profileNameLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              String profileName = _profileNameController.text;
              Map<String, String> data = {'name': profileName};
              Future<bool> futureResponse = _endpoint.create(token, data);
              futureResponse.then(
                (value) => {
                  if (value == true)
                    {
                      _notification.sucess(),
                    }
                  else
                    {
                      _notification.error(),
                    }
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
