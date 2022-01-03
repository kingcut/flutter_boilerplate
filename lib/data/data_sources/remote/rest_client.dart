import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_data.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_list_data.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/request.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:retrofit/retrofit.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'rest_client.g.dart';

// @RestApi(
//     baseUrl:
//         "hti(
//     baseUrl:
//         "https://raw.githubusercontent.com/kingcut/flutter_boilerplate/main/test/")
class RestClient {
  final Request request;
  RestClient(this.request);
  // factory RestClient(Dio dio, {String baseUrl}) = _RestClient;


  // @GET("/tasks.json")
  // Future<ResponseListData<Task>> getTasks(Function(Map<String, dynamic>) factoryFunction);


  Future<ResponseListData<Task>?>? getTasksA() async {
    final response = await request.get(Uri.http('https://raw.githubusercontent.com/kingcut/flutter_boilerplate/main/test/', '/tasks.json'));
    return ResponseListData<Task>.fromJson(json.decode(response.body),(item) => Task.fromJson(item));
  }
}
