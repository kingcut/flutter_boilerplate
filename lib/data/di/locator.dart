import 'package:flutter_boilerplate/data/data_sources/remote/app_client.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/rest_client.dart';
import 'package:flutter_boilerplate/data/repositories/task_repo_impl.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator() async {
  _registerClient();
  _registerRepository();
}

Future _registerClient() async {
  locator.registerLazySingleton<AppClient>(() => AppClient());
  locator.registerLazySingleton<RestClient>(() {
    final request = locator.get<AppClient>();
    return RestClient(request);
  });
}

Future _registerRepository() async {
  locator.registerLazySingleton<TaskRepo>(() => TaskRepoImpl());
}
