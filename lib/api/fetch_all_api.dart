import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projeto/models/model_generic.dart';

import 'endpoint/endpoint.dart';

const pageURI = 'http://192.168.0.108:8080/';
const bearerToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpdGFsb21kZCIsImlzcyI6IlByb2pldG8gQVBJIiwiZXhwIjoxNjU4MTkyMDc3LCJpYXQiOjE2NTgxODg0Nzd9.3Ye80c4C-DYQVaRnFfqT34AOIrrosdgp70H1xqbE0vo';

class FetchAllApi {
  final Endpoint endpoint;

  FetchAllApi({required this.endpoint});

  Future<List<Generic>> fetch() async {
    final response = await http.get(
      Uri.parse(pageURI + endpoint.getEndpointName()),
      headers: {
        HttpHeaders.authorizationHeader: bearerToken,
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
