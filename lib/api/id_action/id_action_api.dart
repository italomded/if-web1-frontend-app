import 'package:http/http.dart';
import 'package:projeto/api/token.dart';

import '../endpoint/endpoint.dart';

abstract class IdActionApi {
  final Endpoint endpoint;

  IdActionApi({required this.endpoint});

  Future<List<String>> go(Token token, String id) async {
    final response = await doRequest(token, id);
    return [response.statusCode.toString()];
  }

  Future<Response> doRequest(Token token, String id);
}
