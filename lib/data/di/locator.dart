import 'package:flutter_boilerplate/data/repositories/task_repo_impl.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator() async {
  _registerRepository();
}

Future _registerRepository() async {
  locator.registerLazySingleton<TaskRepo>(() => TaskRepoImpl());
}
