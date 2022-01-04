import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:flutter_boilerplate/domain/use_cases/get_task.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance..allowReassignment = true;

void setupLocator() {
  /// Use case
  locator.registerFactory(() => GetTask(locator<TaskRepo>()));
}
