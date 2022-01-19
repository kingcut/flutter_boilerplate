import 'package:flutter_boilerplate/data/data_sources/remote/app_client.dart';
import 'package:flutter_boilerplate/environment/environment.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final AppClient request;

  RestClient(this.request);

  Uri _uri([Map<String, dynamic>? queryParameters]) {
    final environment = locator<Environment>();
    return Uri.http('myjson.dit.upm.es', '/api/bins/58wl', queryParameters);
  }

  Future<http.Response> getTasks() async {
    final uri = Uri.http('myjson.dit.upm.es', '/api/bins/58wl');
    final http.Response response = await request.get(uri);
    return response;
  }
}
