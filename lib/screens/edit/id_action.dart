import 'package:flutter/material.dart';
import 'package:projeto/api/id_action/id_action_api.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String statusNameLabelText = "Resource ID";
const String createButtonText = "Confirm";

class IdAction extends StatefulWidget {
  final IdActionApi actionApi;
  final String appBarTitle;

  const IdAction({
    Key? key,
    required this.actionApi,
    required this.appBarTitle,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IdActionState();
  }
}

class _IdActionState extends State<IdAction> {
  final TextEditingController _statusNameController = TextEditingController();
  late NotificationAlert _notification;
  late Token _token;

  @override
  Widget build(BuildContext context) {
    _token = ModalRoute.of(context)!.settings.arguments as Token;
    _notification = NotificationAlert(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: Column(
        children: [
          InputField(
            labelController: _statusNameController,
            labelText: statusNameLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              String resourceId = _statusNameController.text;
              Future<bool> futureResponse =
                  widget.actionApi.go(_token, resourceId);
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
