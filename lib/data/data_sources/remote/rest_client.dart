import 'package:flutter_boilerplate/data/data_sources/remote/request.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final Request request;

  RestClient(this.request);

  Future<http.Response> getTasks() async {
    final uri = Uri.http('myjson.dit.upm.es', '/api/bins/58wl');
    final http.Response response = await request.get(uri);
    return response;
  }
}
