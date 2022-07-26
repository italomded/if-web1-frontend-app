import 'package:projeto/models/model_generic.dart';

import 'model_profile.dart';

class Transaction implements Generic {
  @override
  int? id;
  @override
  String? name;
  @override
  bool? status;
  String? url;
  int? serviceId;
  List<Profile>? profiles;

  Transaction(
      {this.id,
      this.name,
      this.status,
      this.url,
      this.serviceId,
      this.profiles});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    url = json['url'];
    serviceId = json['service_id'];
    if (json['profiles'] != null) {
      profiles = <Profile>[];
      json['profiles'].forEach((v) {
        profiles!.add(Profile.fromJson(v));
      });
    }
  }
}
