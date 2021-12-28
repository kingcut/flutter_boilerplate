import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/domain/common/response_entity.dart';

abstract class TaskRepo {

  Future<ResponseEntity<List<Task>>> getTasks();
}