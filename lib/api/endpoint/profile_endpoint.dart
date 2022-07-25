import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:projeto/api/api.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/token.dart';

import 'package:http/http.dart' as http;
import 'package:projeto/models/model_generic.dart';

import '../../models/model_profile.dart';

class ProfileEndpoint extends Endpoint {
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

  Future<bool> removeUser(Token token, Map<String, String> data) async {
    final response = await http.delete(
      Uri.parse("${Api.url}${getEndpointName()}/user"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return super.giveResponse(response);
  }

  Future<bool> addUser(Token token, Map<String, String> data) async {
    final response = await http.put(
      Uri.parse("${Api.url}${getEndpointName()}/user"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return super.giveResponse(response);
  }

  Future<bool> removeTransaction(Token token, Map<String, String> data) async {
    final response = await http.delete(
      Uri.parse("${Api.url}${getEndpointName()}/transaction"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return super.giveResponse(response);
  }

  Future<bool> addTransaction(Token token, Map<String, String> data) async {
    final response = await http.put(
      Uri.parse("${Api.url}${getEndpointName()}/transaction"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return super.giveResponse(response);
  }

  @override
  Profile toModel(dynamic) {
    return Profile.fromJson(dynamic);
  }
}
