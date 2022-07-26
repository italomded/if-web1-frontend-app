import 'model_generic.dart';
import 'model_service.dart';

class System implements Generic {
  @override
  int? id;
  @override
  String? name;
  @override
  bool? status;
  List<Service>? services;

  System({this.id, this.name, this.status, this.services});

  System.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    if (json['services'] != null) {
      services = <Service>[];
      json['services'].forEach((v) {
        services!.add(Service.fromJson(v));
      });
    }
  }
}
