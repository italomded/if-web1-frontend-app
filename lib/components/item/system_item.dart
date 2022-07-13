import 'package:flutter/material.dart';

import '../../models/model_system.dart';
import '../../screens/lists/generic_list.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

const systemChildName = "Services";

class SystemItem extends StatelessWidget {
  final System system;

  const SystemItem({Key? key, required this.system}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IdInformation(id: system.id!),
          StatusInformation(status: system.status!),
          NameInformation(name: system.name!),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GenericList(
                    appBarTitle: systemChildName,
                    itemList: system.services!,
                  );
                }));
              },
              child: const Text(systemChildName))
        ],
      ),
    ));
  }
}
