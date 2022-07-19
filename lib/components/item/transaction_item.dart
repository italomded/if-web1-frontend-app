import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';

import '../../models/model_transaction.dart';
import '../../screens/lists/generic_list.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

const serviceChildName = "Profiles";
const serviceURLField = "URL";
const serviceSystemIdField = "Service Id";

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IdInformation(id: transaction.id!),
          StatusInformation(status: transaction.status!),
          NameInformation(name: transaction.name!),
          GenericInformation(
            icon: Icons.insert_link,
            text: transaction.url!,
            titleText: serviceURLField,
          ),
          GenericInformation(
            icon: Icons.key_outlined,
            text: transaction.serviceId!.toString(),
            titleText: serviceSystemIdField,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GenericList(
                    appBarTitle: serviceChildName,
                    itemList: transaction.profiles!,
                  );
                }));
              },
              child: const Text(serviceChildName))
        ],
      ),
    ));
  }
}
