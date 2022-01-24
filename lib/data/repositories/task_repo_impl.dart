import 'package:flutter_boilerplate/data/data_sources/common/response_list_data.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/rest_client.dart';
import 'package:flutter_boilerplate/data/di/locator.dart';
import 'package:flutter_boilerplate/domain/entities/response_list_entity.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/data/repositories/base/base_repository.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';

class TaskRepoImpl extends BaseRepositoryImpl implements TaskRepo {
  @override
  Future<ResponseListEntity<Task>> getTasks() async {
    final result = await safeApiCall<ResponseListData<Task>>(
      locator<RestClient>().getTasks(),
      (json) {
        return ResponseListData.fromJson(json, (item) => Task.fromJson(item));
      },
    );
    if (result.isSuccessful) {
      return (result as ResultSuccessEntity<ResponseListData<Task>>).data;
    }
    throw result;
  }
}
