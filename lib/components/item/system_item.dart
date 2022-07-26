import 'package:flutter/material.dart';
import 'package:projeto/components/item/button_component/generic_list_button.dart';
import 'package:projeto/components/item/generic_item.dart';

import '../../models/model_system.dart';
import '../../screens/lists/generic_list.dart';

const systemChildName = "Services";

class SystemItem extends GenericItem {
  const SystemItem({Key? key, required super.generic}) : super(key: key);

  @override
  Column complex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericListButton(
            genericList: GenericList(
                itemList: (generic as System).services!,
                appBarTitle: systemChildName),
            serviceChildName: systemChildName),
      ],
    );
  }
}
