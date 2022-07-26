import 'package:flutter/material.dart';
import 'package:projeto/components/item/button_component/generic_list_button.dart';
import 'package:projeto/components/item/generic_item.dart';

import '../../models/model_profile.dart';
import '../../screens/lists/generic_list.dart';

const firstServiceChildName = "Transactions";
const secondServiceChildName = "Users";

class ProfileItem extends GenericItem {
  const ProfileItem({Key? key, required super.generic}) : super(key: key);

  @override
  Column complex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericListButton(
            genericList: GenericList(
                itemList: (generic as Profile).transactions!,
                appBarTitle: firstServiceChildName),
            serviceChildName: firstServiceChildName),
        GenericListButton(
            genericList: GenericList(
                itemList: (generic as Profile).users!,
                appBarTitle: secondServiceChildName),
            serviceChildName: secondServiceChildName)
      ],
    );
  }
}
