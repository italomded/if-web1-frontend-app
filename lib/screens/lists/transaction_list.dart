import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';

import 'package:projeto/components/screen/screen_list_base.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_transaction.dart';

import '../../api/endpoint/transaction_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/transaction_item.dart';

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
  late Future<List<Generic>> futureGenericList;
  final Endpoint endpoint = TransactionEndpoint();

  void refreshScreen() {
    setState(() {
      futureGenericList = endpoint.fetch(widget.token);
    });
  }

  @override
  void initState() {
    super.initState();
    futureGenericList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenListBase(
      refreshScreen: refreshScreen,
      appBarTitle: appBarTitle,
      endpoint: endpoint,
      futureGenericList: futureGenericList,
      convertToItemFunction: (Generic generic) {
        return TransactionItem(generic: generic);
      },
      token: widget.token,
      createResourceRoute: const CreateTransaction(),
    );
  }
}
