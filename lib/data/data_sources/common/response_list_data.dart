import 'package:flutter_boilerplate/data/data_helper.dart';
import 'package:flutter_boilerplate/data/models/response_list_entity.dart';

class ResponseListData<T> extends ResponseListEntity<T> {
  ResponseListData(List<T> data) : super(data);

  factory ResponseListData.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) factoryFunction,
  ) =>
      ResponseListData(parseJsonToList('data', json, factoryFunction));
}
