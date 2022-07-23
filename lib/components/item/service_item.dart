import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';

import '../../models/model_service.dart';
import '../../screens/lists/generic_list.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

const serviceChildName = "Transactions";
const serviceURLField = "URL";
const serviceSystemIdField = "System Id";

class ServiceItem extends StatelessWidget {
  final Service service;

  const ServiceItem({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IdInformation(id: service.id!),
            StatusInformation(status: service.status!),
            NameInformation(name: service.name!),
            GenericInformation(
              icon: Icons.insert_link,
              text: service.url!,
              titleText: serviceURLField,
            ),
            GenericInformation(
              icon: Icons.key_outlined,
              text: service.systemId!.toString(),
              titleText: serviceSystemIdField,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return GenericList(
                          appBarTitle: serviceChildName,
                          itemList: service.transactions!,
                        );
                      },
                    ),
                  );
                },
                child: const Text(serviceChildName))
          ],
        ),
      ),
    );
  }
}
