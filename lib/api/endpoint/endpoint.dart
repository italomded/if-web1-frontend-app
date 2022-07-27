import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projeto/api/api.dart';
import 'package:projeto/api/token.dart';
import 'package:projeto/models/model_creation_error.dart';
import 'package:projeto/models/model_generic.dart';

abstract class Endpoint {
  List<Generic> allToModel(List<dynamic> dataList);
  String getEndpointName();
  Generic toModel(dynamic dynamic);

  Future<List<String>> create(Token token, Map<String, String> data) async {
    final response = await http.post(
      Uri.parse(Api.url + getEndpointName()),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return <String>[response.statusCode.toString()];
    } else if (response.statusCode == 400) {
      return CreationError.parseErrors(response);
    } else {
      return <String>[response.statusCode.toString()];
    }
  }

  Future<List<Generic>> fetch(Token token) async {
    final response = await http.get(
      Uri.parse(Api.url + getEndpointName()),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      List<Generic> newList = allToModel(dataList);
      return newList;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<Generic> fetchOne(Token token, String id) async {
    final response = await http.get(
      Uri.parse("${Api.url}${getEndpointName()}/$id"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
      },
    );
    if (response.statusCode == 200) {
      Generic generic = toModel(jsonDecode(response.body));
      return generic;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
