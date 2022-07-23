import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';

import '../../models/model_user.dart';
import '../../screens/lists/generic_list.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

const profileChildName = "Profiles";
const loginTitleText = "Login";
const registerTitleText = "Register";

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IdInformation(id: user.id!),
          GenericInformation(
            icon: Icons.login,
            text: user.login!,
            titleText: loginTitleText,
          ),
          NameInformation(name: user.name!),
          GenericInformation(
            icon: Icons.calendar_month,
            text: user.register!,
            titleText: registerTitleText,
          ),
          StatusInformation(status: user.status!),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return GenericList(
                    appBarTitle: profileChildName,
                    itemList: user.profiles!,
                  );
                }),
              );
            },
            child: const Text(profileChildName),
          ),
        ],
      ),
    ));
  }
}
