import 'package:projeto/api/endpoint/endpoint.dart';

import '../../models/model_user.dart';

class UserEndpoint extends Endpoint {
  final String endpointName = "user";

  @override
  List<User> allToModel(List<dynamic> dataList) {
    List<User> list = [];
    for (var element in dataList) {
      list.add(User.fromJson(element));
    }
    return list;
  }

  @override
  String getEndpointName() {
    return endpointName;
  }

  @override
  User toModel(dynamic) {
    return User.fromJson(dynamic);
  }
}
