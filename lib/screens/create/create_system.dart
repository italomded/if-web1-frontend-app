import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/endpoint/system_endpoint.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Create System";
const String systemNameLabelText = "Name";
const String createButtonText = "Create resource";

class CreateSystem extends StatefulWidget {
  const CreateSystem({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateSystemState();
  }
}

class _CreateSystemState extends State<CreateSystem> {
  final TextEditingController _systemNameController = TextEditingController();
  final Endpoint _endpoint = SystemEndpoint();
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
            labelController: _systemNameController,
            labelText: systemNameLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              String systemName = _systemNameController.text;
              Map<String, String> data = {'name': systemName};
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
