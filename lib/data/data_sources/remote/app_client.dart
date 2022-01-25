import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AppClient extends BaseClient {
  final Client _client = Client();

  AppClient();

  Uri endpoint(Uri url) {
    return url;
  }

  void _logEndpoint(String method, Uri url) {
    debugPrint('[${method.toUpperCase()}] ${endpoint(url).toString()}');
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Cache-Control'] = 'no-cache';

    return _client.send(request);
  }

  @override
  Future<Response> head(url, {Map<String, String>? headers}) {
    _logEndpoint('head', url);
    return _client.head(endpoint(url), headers: headers);
  }

  @override
  Future<Response> get(url, {Map<String, String>? headers}) {
    _logEndpoint('get', url);
    return _client.get(endpoint(url), headers: headers);
  }

  @override
  Future<Response> post(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('post', url);
    return _client.post(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> put(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('put', url);
    return _client.put(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> patch(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('patch', url);
    return _client.patch(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> delete(url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    _logEndpoint('delete', url);
    return _client.delete(
      endpoint(url),
      headers: headers,
      body: body,
      encoding: encoding,
    );
  }
}


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}