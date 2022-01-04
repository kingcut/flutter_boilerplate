import 'package:flutter_boilerplate/domain/common/response_entity.dart';

class ResponseData<T> extends ResponseEntity<T> {
  ResponseData(T data) : super(data);

  factory ResponseData.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) factoryFunction,
  ) =>
      ResponseData(factoryFunction(json['data']));
}
