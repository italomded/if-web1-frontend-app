import 'package:flutter/material.dart';
import 'package:projeto/components/information/generic_information.dart';
import 'package:projeto/components/item/button_component/generic_list_button.dart';
import 'package:projeto/components/item/generic_item.dart';

import '../../models/model_transaction.dart';
import '../../screens/lists/generic_list.dart';

const serviceChildName = "Profiles";
const serviceURLField = "URL";
const serviceSystemIdField = "Service Id";

class TransactionItem extends GenericItem {
  const TransactionItem({Key? key, required super.generic}) : super(key: key);

  @override
  Column complex() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GenericInformation(
          icon: Icons.insert_link,
          text: (generic as Transaction).url!,
          titleText: serviceURLField,
        ),
        GenericInformation(
          icon: Icons.key_outlined,
          text: (generic as Transaction).serviceId!.toString(),
          titleText: serviceSystemIdField,
        ),
        GenericListButton(
            genericList: GenericList(
                itemList: (generic as Transaction).profiles!,
                appBarTitle: serviceChildName),
            serviceChildName: serviceChildName),
      ],
    );
  }
}
