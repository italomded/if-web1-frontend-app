import 'package:flutter/material.dart';
import 'package:projeto/api/fetch_all_api.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_service.dart';

import '../../api/endpoint/service_endpoint.dart';
import '../../api/token.dart';
import '../../components/item/service_item.dart';
import '../../measures/pattern_measures.dart';

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

  @override
  void initState() {
    super.initState();
    futureServiceList =
        FetchAllApi(endpoint: ServiceEndpoint()).fetch(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appBarTitle),
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
            return Text("${snapshot.error}");
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
