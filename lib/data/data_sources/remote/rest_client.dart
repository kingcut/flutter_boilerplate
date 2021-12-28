import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_data.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://raw.githubusercontent.com/kingcut/flutter_boilerplate/main/test/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks.json")
  Future<ResponseData<List<Task>>> getTasks();
}