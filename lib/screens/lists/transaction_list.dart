import 'package:flutter/material.dart';
import 'package:projeto/api/fetch_all_api.dart';
import 'package:projeto/models/model_generic.dart';

import '../../api/endpoint/transaction_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/transaction_item.dart';
import '../../measures/pattern_measures.dart';
import '../../models/model_transaction.dart';

const String appBarTitle = "Transactions";

class TransactionList extends StatefulWidget {
  final Token token;

  const TransactionList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  late Future<List<Generic>> futureTransactionList;

  @override
  void initState() {
    super.initState();
    futureTransactionList =
        FetchAllApi(endpoint: TransactionEndpoint()).fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
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
            return Text("${snapshot.error}");
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
