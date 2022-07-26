import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/endpoint/service_endpoint.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Create Service";
const String serviceNameLabelText = "Name";
const String serviceURLLabelText = "URL";
const String serviceSystemLabelText = "System ID";
const String createButtonText = "Create resource";

class CreateService extends StatefulWidget {
  const CreateService({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateServiceState();
  }
}

class _CreateServiceState extends State<CreateService> {
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceURLController = TextEditingController();
  final TextEditingController _serviceSystemController =
      TextEditingController();
  final Endpoint _endpoint = ServiceEndpoint();
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
            labelController: _serviceNameController,
            labelText: serviceNameLabelText,
            secret: false,
            padding: PatternMeasures.inputFieldPaddingPattern,
          ),
          InputField(
            labelController: _serviceURLController,
            labelText: serviceURLLabelText,
            secret: false,
            padding: PatternMeasures.inputFieldPaddingPattern,
          ),
          InputField(
            labelController: _serviceSystemController,
            labelText: serviceSystemLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> data = {
                'name': _serviceNameController.text,
                'url': _serviceURLController.text,
                'systemId': _serviceSystemController.text,
              };
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
