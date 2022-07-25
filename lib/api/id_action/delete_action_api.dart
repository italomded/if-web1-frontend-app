import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projeto/api/api.dart';
import 'package:projeto/api/token.dart';

import 'id_action_api.dart';

class DeleteActionApi extends IdActionApi {
  DeleteActionApi({required super.endpoint});

  @override
  Future<http.Response> doRequest(Token token, String id) {
    return http.delete(
      Uri.parse("${Api.url}${super.endpoint.getEndpointName()}/$id"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
      },
    );
  }
}
