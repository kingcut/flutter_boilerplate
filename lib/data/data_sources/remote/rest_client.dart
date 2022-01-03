import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_data.dart';
import 'package:flutter_boilerplate/data/data_sources/common/response_list_data.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/request.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:retrofit/retrofit.dart';

// part 'rest_client.g.dart';

// @RestApi(
//     baseUrl:
//         "https://raw.githubusercontent.com/kingcut/flutter_boilerplate/main/test/")
class RestClient {
  final Request request;
  RestClient(this.request)

  // @GET("/tasks.json")
  // Future<ResponseListData<Task>> getTasks(Function(Map<String, dynamic>) factoryFunction);
  Future<ResponseListData<Task>> getTasks() async {
    request.get(url)
  }

}
