import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';

import 'package:projeto/components/screen/screen_list_base.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/screens/create/create_service.dart';

import '../../api/endpoint/service_endpoint.dart';
import '../../api/token.dart';

import '../../components/item/service_item.dart';

const String appBarTitle = "Services";

class ServiceList extends StatefulWidget {
  final Token token;

  const ServiceList({Key? key, required this.token}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ServiceListState();
  }
}

class ServiceListState extends State<ServiceList> {
  late Future<List<Generic>> futureGenericList;
  final Endpoint endpoint = ServiceEndpoint();

  void refreshScreen() {
    setState(() {
      futureGenericList = endpoint.fetch(widget.token);
    });
  }

  @override
  void initState() {
    super.initState();
    futureGenericList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenListBase(
      refreshScreen: refreshScreen,
      appBarTitle: appBarTitle,
      endpoint: endpoint,
      futureGenericList: futureGenericList,
      convertToItemFunction: (Generic generic) {
        return ServiceItem(generic: generic);
      },
      token: widget.token,
      createResourceRoute: const CreateService(),
    );
  }
}
