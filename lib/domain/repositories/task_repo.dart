import 'package:flutter_boilerplate/data/models/response_list_entity.dart';
import 'package:flutter_boilerplate/data/models/task.dart';

abstract class TaskRepo {
  Future<ResponseListEntity<Task>> getTasks();
}
