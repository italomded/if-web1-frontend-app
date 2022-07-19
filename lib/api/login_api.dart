import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto/api/token.dart';

const pageURI = 'http://192.168.0.108:8080/authentication';

class LoginApi {
  Future<Token> createAlbum(String title, String password) async {
    final response = await http.post(
      Uri.parse(pageURI),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'login': title, 'password': password}),
    );
    if (response.statusCode == 200) {
      return Token.fromJson(jsonDecode(response.body));
    } else {
      return Token(token: "403", type: "Bearer");
    }
  }
}
