import 'dart:convert';

import 'package:http/http.dart';

class CreationError {
  String? label;
  String? message;

  CreationError({this.label, this.message});

  CreationError.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    message = json['message'];
  }

  static List<String> parseErrors(Response response) {
    List<String> list = [];
    list.add(response.statusCode.toString());
    if (response.body.isNotEmpty) {
      List<dynamic> dataList = jsonDecode(response.body);
      for (var element in dataList) {
        CreationError creationError = CreationError.fromJson(element);
        list.add("${creationError.label}: ${creationError.message}");
      }
      return list;
    } else {
      list.add("Invalid resource values;");
      return list;
    }
  }
}
