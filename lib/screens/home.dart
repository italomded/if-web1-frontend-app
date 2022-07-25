import 'package:flutter/material.dart';
import 'package:projeto/api/token.dart';
import 'package:projeto/screens/lists/profile_list.dart';
import 'package:projeto/screens/lists/service_list.dart';
import 'package:projeto/screens/lists/system_list.dart';
import 'package:projeto/screens/lists/transaction_list.dart';
import 'package:projeto/screens/lists/user_list.dart';
import 'package:projeto/screens/login.dart';

import '../measures/pattern_measures.dart';

const String appBarTitle = "Home";

const String optionNameProfile = "Profiles";
const String optionNameUser = "Users";
const String optionNameSystem = "Systems";
const String optionNameService = "Services";
const String optionNameTransaction = "Transactions";

const String buttonTitle = "Ver";

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Login();
                  },
                ),
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: const ListOptions(),
    );
  }
}

class ListOptions extends StatelessWidget {
  const ListOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Token token = ModalRoute.of(context)!.settings.arguments as Token;
    return WillPopScope(
        child: ListView(
          padding: PatternMeasures.listCardPadding,
          children: [
            ItemOption(
              optionName: optionNameSystem,
              newRoute: SystemList(token: token),
            ),
            ItemOption(
              optionName: optionNameService,
              newRoute: ServiceList(token: token),
            ),
            ItemOption(
              optionName: optionNameTransaction,
              newRoute: TransactionList(token: token),
            ),
            ItemOption(
              optionName: optionNameProfile,
              newRoute: ProfileList(token: token),
            ),
            ItemOption(
              optionName: optionNameUser,
              newRoute: UserList(token: token),
            ),
          ],
        ),
        onWillPop: () async => false);
  }
}

class ItemOption extends StatelessWidget {
  final String optionName;
  final Widget newRoute;

  const ItemOption({Key? key, required this.optionName, required this.newRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: ListTile(
              title: Text(optionName),
            ),
          ),
          Flexible(
            flex: 1,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return newRoute;
                    },
                  ),
                );
              },
              child: const Text(buttonTitle),
            ),
          ),
        ],
      ),
    );
  }
}
