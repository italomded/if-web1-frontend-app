import 'package:flutter/material.dart';
import 'package:projeto/screens/lists/system_list.dart';

import 'lists/profile_list.dart';

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
      ),
      body: const ListOptions(),
    );
  }
}

class ListOptions extends StatelessWidget {
  const ListOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ItemOption(
          optionName: optionNameSystem,
          newRoute: SystemList(),
        ),
        ItemOption(
          optionName: optionNameService,
          newRoute: ProfileList(),
        ),
      ],
    );
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return newRoute;
                }));
              },
              child: const Text(buttonTitle),
            ),
          ),
        ],
      ),
    );
  }
}
