import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';
import 'package:projeto/components/item/button_component/generic_list_button.dart';
import 'package:projeto/components/item/generic_item.dart';

import '../../models/model_user.dart';
import '../../screens/lists/generic_list.dart';

const profileChildName = "Profiles";
const loginTitleText = "Login";
const registerTitleText = "Register";

class UserItem extends GenericItem {
  const UserItem({Key? key, required super.generic}) : super(key: key);

  @override
  Column complex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericInformation(
          icon: Icons.login,
          text: (generic as User).login!,
          titleText: loginTitleText,
        ),
        GenericInformation(
          icon: Icons.calendar_month,
          text: (generic as User).register!,
          titleText: registerTitleText,
        ),
        GenericListButton(
            genericList: GenericList(
                itemList: (generic as User).profiles!,
                appBarTitle: profileChildName),
            serviceChildName: profileChildName),
      ],
    );
  }
}
