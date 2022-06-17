import 'dart:io';

import 'package:flutter_boilerplate/data/data_sources/remote/app_client.dart';
import 'package:flutter_boilerplate/data/data_sources/remote/rest_client.dart';
import 'package:flutter_boilerplate/data/flavor/prod_config.dart';
import 'package:flutter_boilerplate/data/flavor/staging_config.dart';
import 'package:flutter_boilerplate/data/repositories/task_repo_impl.dart';
import 'package:flutter_boilerplate/data/shared_pref/shared_preference_helper.dart';
import 'package:flutter_boilerplate/domain/repositories/task_repo.dart';
import 'package:flutter_boilerplate/domain/flavor/flavor_config.dart';
import 'package:flutter_boilerplate/data/flavor/dev_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance..allowReassignment = true;

Future setupLocator(String? flavor) async {
  HttpOverrides.global = MyHttpOverrides();
  _registerClient();
  _registerSharedPref();
  _registerRepository();
  _registerEnvironment(flavor);
}

void _registerEnvironment(String? flavor) {
  locator.registerLazySingleton<FlavorConfig>(() => _getConfig(flavor));
}

FlavorConfig _getConfig(String? flavor) {
  switch (flavor) {
    case 'prod':
      return ProdConfig();
    case 'staging':
      return StagingConfig();
    default:
      return DevConfig();
  }
}

Future _registerSharedPref() async {
  locator.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());

  locator.registerSingleton(
      SharedPreferenceHelper(await locator.getAsync<SharedPreferences>()));
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
