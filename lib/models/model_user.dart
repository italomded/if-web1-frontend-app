import 'package:projeto/models/model_generic.dart';

import 'model_profile.dart';

class User implements Generic {
  @override
  int? id;
  @override
  String? name;
  String? login;
  @override
  bool? status;
  String? register;
  List<Profile>? profiles;

  User(
      {this.id,
      this.name,
      this.login,
      this.status,
      this.register,
      this.profiles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    login = json['login'];
    status = json['status'];
    register = json['register'];
    if (json['profiles'] != null) {
      profiles = <Profile>[];
      json['profiles'].forEach((v) {
        profiles!.add(Profile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['login'] = login;
    data['status'] = status;
    data['register'] = register;
    if (profiles != null) {
      data['profiles'] = profiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
