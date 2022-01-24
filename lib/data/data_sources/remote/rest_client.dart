import 'package:flutter_boilerplate/data/data_sources/remote/app_client.dart';
import 'package:flutter_boilerplate/domain/flavor/flavor_config.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';
import 'package:http/http.dart' as http;

class RestClient {
  final AppClient request;

  RestClient(this.request);

  Uri _uri(String api, {Map<String, dynamic>? queryParameters}) {
    final config = locator<FlavorConfig>();
    return Uri.http(config.apiHost, '${config.apiPath}$api', queryParameters);
  }

  Future<http.Response> getTasks() async {
    final http.Response response = await request.get(_uri('58wl'));
    return response;
  }
}
