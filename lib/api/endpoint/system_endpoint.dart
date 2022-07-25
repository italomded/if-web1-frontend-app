import 'package:projeto/api/endpoint/endpoint.dart';

import '../../models/model_system.dart';

class SystemEndpoint extends Endpoint {
  final String endpointName = "system";

  @override
  List<System> allToModel(List<dynamic> dataList) {
    List<System> list = [];
    for (var element in dataList) {
      list.add(System.fromJson(element));
    }
    return list;
  }

  @override
  String getEndpointName() {
    return endpointName;
  }

  @override
  System toModel(dynamic) {
    return System.fromJson(dynamic);
  }
}
