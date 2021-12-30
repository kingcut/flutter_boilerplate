import 'package:flutter_boilerplate/data/data_sources/common/base_response.dart';
import 'package:flutter_boilerplate/domain/common/response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_data.g.dart';

@JsonSerializable()
class ResponseData<T> extends BaseResponse<T> {

  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T? data;

  ResponseData();

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);

}

T _dataFromJson<T, S, U>(Map<String, dynamic> input, [S? other1, U? other2]) =>
    input['value'] as T;

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S? other1, U? other2]) =>
    {'value': input};