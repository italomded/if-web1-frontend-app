import 'package:projeto/api/endpoint/endpoint.dart';

import '../../models/model_transaction.dart';

class TransactionEndpoint implements Endpoint {
  final String endpointName = "transaction";

  @override
  List<Transaction> allToModel(List<dynamic> dataList) {
    List<Transaction> list = [];
    for (var element in dataList) {
      list.add(Transaction.fromJson(element));
    }
    return list;
  }

  @override
  String getEndpointName() {
    return endpointName;
  }
}
