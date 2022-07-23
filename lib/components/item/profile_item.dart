import 'package:flutter/material.dart';

import '../../models/model_profile.dart';
import '../../screens/lists/generic_list.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

const firstServiceChildName = "Transactions";
const secondServiceChildName = "Users";
const serviceURLField = "URL";
const serviceSystemIdField = "System Id";

class ProfileItem extends StatelessWidget {
  final Profile profile;

  const ProfileItem({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IdInformation(id: profile.id!),
            StatusInformation(status: profile.status!),
            NameInformation(name: profile.name!),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GenericList(
                        appBarTitle: firstServiceChildName,
                        itemList: profile.transactions!,
                      );
                    },
                  ),
                );
              },
              child: const Text(firstServiceChildName),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GenericList(
                        appBarTitle: secondServiceChildName,
                        itemList: profile.users!,
                      );
                    },
                  ),
                );
              },
              child: const Text(secondServiceChildName),
            )
          ],
        ),
      ),
    );
  }
}
