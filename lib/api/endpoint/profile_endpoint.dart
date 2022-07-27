import 'dart:convert';
import 'dart:io';

import 'package:projeto/api/api.dart';
import 'package:projeto/api/endpoint/endpoint.dart';
import 'package:projeto/api/token.dart';

import 'package:http/http.dart' as http;
import 'package:projeto/models/model_creation_error.dart';

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

  Future<List<String>> removeUser(Token token, Map<String, String> data) async {
    final response = await http.delete(
      Uri.parse("${Api.url}${getEndpointName()}/user"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return makeResponse(response);
  }

  Future<List<String>> addUser(Token token, Map<String, String> data) async {
    final response = await http.put(
      Uri.parse("${Api.url}${getEndpointName()}/user"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return makeResponse(response);
  }

  Future<List<String>> removeTransaction(
      Token token, Map<String, String> data) async {
    final response = await http.delete(
      Uri.parse("${Api.url}${getEndpointName()}/transaction"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return makeResponse(response);
  }

  Future<List<String>> addTransaction(
      Token token, Map<String, String> data) async {
    final response = await http.put(
      Uri.parse("${Api.url}${getEndpointName()}/transaction"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    return makeResponse(response);
  }

  @override
  Profile toModel(dynamic) {
    return Profile.fromJson(dynamic);
  }

  List<String> makeResponse(http.Response response) {
    if (response.statusCode == 400) {
      return CreationError.parseErrors(response);
    } else {
      return [response.statusCode.toString()];
    }
  }
}
