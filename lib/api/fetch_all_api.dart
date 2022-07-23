import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projeto/api/token.dart';
import 'package:projeto/models/model_generic.dart';

import 'endpoint/endpoint.dart';

const pageURI = 'http://192.168.0.108:8080/';

class FetchAllApi {
  final Endpoint endpoint;

  FetchAllApi({required this.endpoint});

  Future<List<Generic>> fetch(Token token) async {
    final response = await http.get(
      Uri.parse(pageURI + endpoint.getEndpointName()),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      List<Generic> newList = endpoint.allToModel(dataList);
      return newList;
    } else {
      // need change
      throw Exception('HTTP ERROR 403');
    }
  }
}
