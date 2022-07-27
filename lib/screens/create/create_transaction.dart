import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/endpoint/transaction_endpoint.dart';
import 'package:projeto/components/screen/notification_alert.dart';
import '../../api/token.dart';
import '../../components/form/input_field.dart';
import '../../measures/pattern_measures.dart';

const String appBarTitle = "Create Transaction";
const String transactionNameLabelText = "Name";
const String transactionURLLabelText = "URL";
const String transactionServiceLabelText = "Service ID";
const String createButtonText = "Create resource";

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreateTransactionState();
  }
}

class _CreateTransactionState extends State<CreateTransaction> {
  final TextEditingController _transactionNameController =
      TextEditingController();
  final TextEditingController _transactionURLController =
      TextEditingController();
  final TextEditingController _transactionServiceController =
      TextEditingController();
  final Endpoint _endpoint = TransactionEndpoint();
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
            labelController: _transactionNameController,
            labelText: transactionNameLabelText,
            secret: false,
            padding: PatternMeasures.inputFieldPaddingPattern,
          ),
          InputField(
            labelController: _transactionURLController,
            labelText: transactionURLLabelText,
            secret: false,
            padding: PatternMeasures.middleInputFieldPaddingPattern,
          ),
          InputField(
            labelController: _transactionServiceController,
            labelText: transactionServiceLabelText,
            secret: false,
            padding: PatternMeasures.lastInputFieldPaddingPattern,
          ),
          ElevatedButton(
            onPressed: () {
              Map<String, String> data = {
                'name': _transactionNameController.text,
                'url': _transactionURLController.text,
                'serviceId': _transactionServiceController.text,
              };
              Future<List<String>> futureResponse =
                  _endpoint.create(token, data);
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
