import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/model_system.dart';

const pageURI = 'http://192.168.0.108:8080/system';
const bearerToken =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpdGFsb21kZCIsImlzcyI6IlByb2pldG8gQVBJIiwiZXhwIjoxNjU3NzI1Nzk2LCJpYXQiOjE2NTc3MjIxOTZ9.q6zQbCPzfB7FySdpKwNlWOprnzL_4DB3ZGZsrjprv_E';

class SystemApi {
  Future<List<System>> fetchSystem() async {
    final response = await http.get(
      Uri.parse(pageURI),
      headers: {
        HttpHeaders.authorizationHeader: bearerToken,
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> dataList = jsonDecode(response.body);
      List<System> systemList = [];
      for (var element in dataList) {
        systemList.add(System.fromJson(element));
      }
      return systemList;
    } else {
      // need change
      throw Exception('HTTP ERROR 403');
    }
  }
}
