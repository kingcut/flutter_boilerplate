import 'package:flutter_boilerplate/domain/common/response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'response_data.g.dart';

@JsonSerializable()
class ResponseData<T> extends ResponseEntity<T> {
  ResponseData(data) : super(data);

  factory ResponseData.fromJson(Map<String, dynamic> json) => _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}
