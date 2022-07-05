import 'package:flutter/material.dart';

import '../../components/item/system_item.dart';
import '../../models/model_system.dart';

const String appBarTitle = "System list";

class SystemList extends StatelessWidget {
  final List<System> itemList;

  const SystemList({Key? key, required this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(appBarTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final System system = itemList[index];
            return SystemItem(system: system);
          },
          itemCount: itemList.length,
        ));
  }
}
