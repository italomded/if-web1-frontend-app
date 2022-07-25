import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto/api/api.dart';
import 'package:projeto/api/token.dart';

class LoginApi {
  Future<Token> makeLogin(String title, String password) async {
    final response = await http.post(
      Uri.parse("${Api.url}authentication"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': title, 'password': password}),
    );
    if (response.statusCode == 200) {
      return Token.fromJson(jsonDecode(response.body));
    } else {
      return Token(token: "NaN", type: "NaN");
    }
  }
}
