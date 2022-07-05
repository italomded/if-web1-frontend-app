import 'package:flutter/material.dart';

import '../../models/model_generic.dart';
import '../information/id_information.dart';
import '../information/name_information.dart';
import '../information/status_information.dart';

class GenericItem extends StatelessWidget {
  final Generic generic;

  const GenericItem({Key? key, required this.generic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          IdInformation(id: generic.id!),
          StatusInformation(status: generic.status!),
          NameInformation(name: generic.name!)
        ],
      ),
    );
  }
}
