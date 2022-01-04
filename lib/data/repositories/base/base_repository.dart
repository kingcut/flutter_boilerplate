import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/data/data_helper.dart';
import 'package:flutter_boilerplate/domain/common/error_type.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:http/http.dart' as http;

abstract class BaseRepositoryImpl {
  Future<ResultEntity<Model>> safeApiCall<Model>(
    Future<http.Response> call,
    Model Function(Map<String, dynamic>) factoryFunction,
  ) async {
    try {
      final response = await call;
      return ResultSuccessEntity(
          _returnResponse(response, factoryFunction) as Model);
    } on SocketException {
      return ResultErrorEntity(
          ErrorType.noNetwork, 'Không có kết nối Internet!');
    } on FormatException catch (e) {
      return ResultErrorEntity(ErrorType.format, e.message);
    } catch (error) {
      return ResultErrorEntity(ErrorType.generic, 'Xảy ra lỗi');
    }
  }

  dynamic _returnResponse(
      http.Response response, Function(Map<String, dynamic>) factoryFunction) {
    switch (response.statusCode) {
      case 200:
        final responseJson = json.decode(response.body);
        debugPrint(response.body);
        return factoryFunction(responseJson);
      case 400:
      case 401:
      case 403:
      case 404:
      case 500:
        final responseJson = json.decode(response.body);
        debugPrint(responseJson);
        return ServerErrorEntity(
          type: ErrorType.server,
          error: lookup(responseJson, ['message']),
          code: lookup(responseJson, ['code']),
        );
      default:
        return ResultErrorEntity(ErrorType.generic, 'Xảy ra lỗi, hãy thử lại!');
    }
  }
}
