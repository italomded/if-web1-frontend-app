import 'package:projeto/api/endpoint/endpoint.dart';

import '../../models/model_profile.dart';

class ProfileEndpoint implements Endpoint {
  final String endpointName = "profile";

  @override
  List<Profile> allToModel(List<dynamic> dataList) {
    List<Profile> list = [];
    for (var element in dataList) {
      list.add(Profile.fromJson(element));
    }
    return list;
  }

  @override
  String getEndpointName() {
    return endpointName;
  }
}
