import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';
import 'package:projeto/components/item/button_component/generic_list_button.dart';
import 'package:projeto/components/item/generic_item.dart';

import '../../models/model_service.dart';
import '../../screens/lists/generic_list.dart';

const serviceChildName = "Transactions";
const serviceURLField = "URL";
const serviceSystemIdField = "System Id";

class ServiceItem extends GenericItem {
  const ServiceItem({Key? key, required super.generic}) : super(key: key);

  @override
  Column complex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericInformation(
          icon: Icons.insert_link,
          text: (generic as Service).url!,
          titleText: serviceURLField,
        ),
        GenericInformation(
          icon: Icons.key_outlined,
          text: (generic as Service).systemId!.toString(),
          titleText: serviceSystemIdField,
        ),
        GenericListButton(
          genericList: GenericList(
              itemList: (generic as Service).transactions!,
              appBarTitle: serviceChildName),
          serviceChildName: serviceChildName,
        )
      ],
    );
  }
}
