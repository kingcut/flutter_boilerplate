import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Request extends http.BaseClient {
  final Client _client = Client();

  Request();

  Uri endpoint(Uri url) {
    return url;
  }

  void _logEndpoint(String method, Uri url) {
    debugPrint('[${method.toUpperCase()}] ${endpoint(url).toString()}');
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-type'] = 'application/json';
    request.headers['Accept'] = 'application/json';
    request.headers['Cache-Control'] = 'no-cache';

    return _client.send(request);
  }

  @override
  Future<http.Response> head(url, {Map<String, String>? headers}) {
    _logEndpoint('head', url);
    return _client.head(endpoint(url), headers: headers);
  }

  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) {
    _logEndpoint('get', url);
    return _client.get(endpoint(url), headers: headers);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('post', url);
    return _client.post(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> put(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('put', url);
    return _client.put(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> patch(url,
      {Map<String, String>? headers, body, Encoding? encoding}) {
    _logEndpoint('patch', url);
    return _client.patch(endpoint(url),
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> delete(url,
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
