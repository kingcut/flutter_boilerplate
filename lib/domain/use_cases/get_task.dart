import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/data/models/task.dart';
import 'package:flutter_boilerplate/domain/common/response_entity.dart';
import 'package:flutter_boilerplate/domain/common/result.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:flutter_boilerplate/domain/use_cases/base_use_case.dart';


class GetTask implements UseCase {
  final TaskRepo _taskRepo;

  const GetTask(this._taskRepo);

  @override
  Future<ResponseEntity<List<Task>>> call() => _taskRepo.getTasks();
}
