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
        ItemOption(optionName: optionNameSystem),
        ItemOption(optionName: optionNameService),
        ItemOption(optionName: optionNameTransaction),
        ItemOption(optionName: optionNameUser),
        ItemOption(optionName: optionNameProfile),
      ],
    );
  }
}

class ItemOption extends StatelessWidget {
  final String optionName;

  const ItemOption({Key? key, required this.optionName}) : super(key: key);

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
                  return const SystemList(
                    itemList: [],
                  );
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
