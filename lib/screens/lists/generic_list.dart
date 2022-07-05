import 'package:flutter/material.dart';

import '../../components/item/generic_item.dart';
import '../../models/model_generic.dart';

class GenericList extends StatelessWidget {
  final List<Generic> itemList;
  final String appBarTitle;

  const GenericList(
      {Key? key, required this.itemList, required this.appBarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final Generic generic = itemList[index];
            return GenericItem(generic: generic);
          },
          itemCount: itemList.length,
        ));
  }
}
