import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/rest_client.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/domain/common/response_entity.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/repositories/base/base_repository.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:logger/logger.dart';

class TaskRepoImpl extends BaseRepository implements TaskRepo {
  // @override
  // Future<List<Task>> getTasks() {
  //   final dio = Dio(); // Provide a dio instance
  //   dio.options.headers["Demo-Header"] =
  //       "demo header"; // config your dio headers globally
  //   final client = RestClient(dio);
  //
  //   client.getTasks().then((value) => null).catchError();
  // }

  @override
  Future<ResponseEntity<List<Task>>> getTasks() async {
    final dio = Dio(); // Provide a dio instance
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    final client = RestClient(dio);

    final result = await safeApiCall<ResponseEntity<List<Task>>>(
      client.getTasks(),
    );
    if (result.isSuccessful) {
      return (result as ResultSuccessEntity<ResponseEntity<List<Task>>>).data;
    }
    throw result;
  }
}
