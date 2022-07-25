import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:projeto/api/api.dart';
import 'package:projeto/api/id_action/id_action_api.dart';
import 'package:projeto/api/token.dart';

class UpdateActionApi extends IdActionApi {
  UpdateActionApi({required super.endpoint});

  @override
  Future<http.Response> doRequest(Token token, String id) {
    return http.put(
      Uri.parse("${Api.url}${super.endpoint.getEndpointName()}/$id"),
      headers: {
        HttpHeaders.authorizationHeader: "${token.type} ${token.token}",
      },
    );
  }
}
