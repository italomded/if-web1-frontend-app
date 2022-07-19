import 'package:flutter/material.dart';
import 'package:projeto/api/fetch_all_api.dart';
import 'package:projeto/models/model_generic.dart';
import 'package:projeto/models/model_service.dart';

import '../../api/endpoint/service_endpoint.dart';
import '../../components/item/service_item.dart';

const String appBarTitle = "Service list";

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

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
    futureServiceList = FetchAllApi(endpoint: ServiceEndpoint()).fetch();
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
