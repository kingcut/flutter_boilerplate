import 'dart:convert';

import 'package:flutter_boilerplate/data/data_sources/remote/app_client.dart';
import 'package:flutter_boilerplate/data/di/locator.dart';
import 'package:http/http.dart';

class AppUri {
  final String path;
  Map<String, String>? parameters;
  AppUri(this.path);

  AppUri append(Map<String, String>? queryParameters) {
    parameters = queryParameters;
    return this;
  }

  Uri get url {
    return Uri.dataFromString('http://myjson.dit.upm.es/$path',
        parameters: parameters);
  }

  Future<Response> get({Map<String, String>? headers}) {
    return locator<AppClient>().get(url, headers: headers);
  }

  Future<Response> post(
      {Map<String, String>? headers, body, Encoding? encoding}) {
    return locator<AppClient>()
        .post(url, headers: headers, body: body, encoding: encoding);
  }

  Future<Response> put(
      {Map<String, String>? headers, body, Encoding? encoding}) {
    return locator<AppClient>()
        .put(url, headers: headers, body: body, encoding: encoding);
  }

  Future<Response> patch(
      {Map<String, String>? headers, body, Encoding? encoding}) {
    return locator<AppClient>()
        .patch(url, headers: headers, body: body, encoding: encoding);
  }

  Future<Response> delete(
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    return locator<AppClient>().delete(
      url,
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}
