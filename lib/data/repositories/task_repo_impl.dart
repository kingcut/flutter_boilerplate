import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/rest_client.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:logger/logger.dart';

class TaskRepoImpl extends TaskRepo {
  @override
  Future<List<Task>> getTasks() {
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    final client = RestClient(dio);

    return client.getTasks();
  }
}
