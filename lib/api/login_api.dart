import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto/api/api.dart';
import 'package:projeto/api/token.dart';
import 'package:projeto/models/model_creation_error.dart';

class LoginApi {
  Future<List<String>> makeLogin(String title, String password) async {
    final response = await http.post(
      Uri.parse("${Api.url}authentication"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': title, 'password': password}),
    );
    if (response.statusCode == 200) {
      Token token = Token.fromJson(jsonDecode(response.body));
      return [response.statusCode.toString(), token.token, token.type];
    } else if (response.statusCode == 400) {
      return CreationError.parseErrors(response);
    } else {
      return [response.statusCode.toString()];
    }
  }
}
