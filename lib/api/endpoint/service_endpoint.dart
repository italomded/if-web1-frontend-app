import 'package:projeto/api/endpoint/endpoint.dart';

import '../../models/model_service.dart';

class ServiceEndpoint extends Endpoint {
  final String endpointName = "service";

  @override
  List<Service> allToModel(List<dynamic> dataList) {
    List<Service> list = [];
    for (var element in dataList) {
      list.add(Service.fromJson(element));
    }
    return list;
  }

  @override
  String getEndpointName() {
    return endpointName;
  }

  @override
  Service toModel(dynamic) {
    return Service.fromJson(dynamic);
  }
}
