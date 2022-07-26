import 'package:projeto/models/model_generic.dart';

import 'model_transaction.dart';

class Service implements Generic {
  @override
  int? id;
  @override
  String? name;
  String? url;
  @override
  bool? status;
  int? systemId;
  List<Transaction>? transactions;

  Service(
      {this.id,
      this.name,
      this.url,
      this.status,
      this.systemId,
      this.transactions});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    status = json['status'];
    systemId = json['system_id'];
    if (json['transactions'] != null) {
      transactions = <Transaction>[];
      json['transactions'].forEach((v) {
        transactions!.add(Transaction.fromJson(v));
      });
    }
  }
}
