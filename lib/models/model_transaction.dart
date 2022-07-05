import 'model_profile.dart';

class Transaction {
  int? id;
  String? name;
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
        profiles!.add(new Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['url'] = url;
    data['service_id'] = serviceId;
    if (profiles != null) {
      data['profiles'] = profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
