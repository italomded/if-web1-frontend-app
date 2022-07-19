import 'package:projeto/models/model_generic.dart';

import '../../models/model_system.dart';

abstract class Endpoint {
  List<Generic> allToModel(List<dynamic> dataList);
  String getEndpointName();
}
