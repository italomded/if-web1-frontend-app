import 'package:flutter/material.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/id_action/delete_action_api.dart';
import 'package:projeto/api/id_action/update_action_api.dart';

import 'package:projeto/components/icon_button/icon_button_navigator_action.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_service.dart';
import 'package:projeto/screens/create/create_service.dart';

import '../../api/endpoint/service_endpoint.dart';
import '../../api/token.dart';
import '../../components/icon_button/icon_button_navigator.dart';
import '../../components/item/service_item.dart';
import '../../measures/pattern_measures.dart';
import '../../components/error_screen.dart';

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
  late Future<List<Generic>> futureServiceList;
  final Endpoint endpoint = ServiceEndpoint();

  @override
  void initState() {
    super.initState();
    futureServiceList = endpoint.fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
        actions: [
          IconButtonNavigator(
            route: const CreateService(),
            token: widget.token,
          ),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: UpdateActionApi(endpoint: endpoint),
            iconData: Icons.extension_off,
          ),
          IconButtonNavigatorAction(
            token: widget.token,
            idActionApi: DeleteActionApi(endpoint: endpoint),
            iconData: Icons.delete,
          ),
        ],
      ),
      body: FutureBuilder<List<Generic>>(
        future: futureServiceList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Service> serviceList = snapshot.data! as List<Service>;
            return ListView.builder(
              padding: PatternMeasures.listCardPadding,
              itemBuilder: (context, index) {
                final Service service = serviceList[index];
                return ServiceItem(
                  service: service,
                );
              },
              itemCount: serviceList.length,
            );
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
