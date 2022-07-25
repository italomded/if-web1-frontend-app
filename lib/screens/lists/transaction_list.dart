import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';
import 'package:projeto/components/icon_button/icon_button_navigator.dart';
import 'package:projeto/components/icon_button/icon_button_navigator_action.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_transaction.dart';

import '../../api/endpoint/transaction_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/transaction_item.dart';
import '../../measures/pattern_measures.dart';
import '../../models/model_transaction.dart';
import '../../components/error_screen.dart';

const String appBarTitle = "Transactions";

class TransactionList extends StatefulWidget {
  final Token token;

  const TransactionList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TransactionListState();
  }
}

class _TransactionListState extends State<TransactionList> {
  late Future<List<Generic>> futureTransactionList;
  final Endpoint endpoint = TransactionEndpoint();

  @override
  void initState() {
    super.initState();
    futureTransactionList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigator(
              route: const CreateTransaction(), token: widget.token),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: UpdateActionApi(endpoint: endpoint),
            iconData: Icons.extension_off,
          ),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: DeleteActionApi(endpoint: endpoint),
            iconData: Icons.delete,
          ),
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureTransactionList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Transaction> transactionList =
                snapshot.data! as List<Transaction>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final Transaction transaction = transactionList[index];
                return TransactionItem(
                  transaction: transaction,
                );
              },
              itemCount: transactionList.length,
            );
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
