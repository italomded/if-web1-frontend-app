import 'package:http/http.dart';
import 'package:projeto/api/token.dart';

import '../endpoint/endpoint.dart';

abstract class IdActionApi {
  final Endpoint endpoint;

  IdActionApi({required this.endpoint});

  Future<bool> go(Token token, String id) async {
    final response = await doRequest(token, id);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<Response> doRequest(Token token, String id);
}
