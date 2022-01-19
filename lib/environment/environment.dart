import 'package:flutter_boilerplate/environment/config/base_config.dart';
import 'package:flutter_boilerplate/environment/config/dev_config.dart';
import 'package:flutter_boilerplate/environment/config/prod_config.dart';
import 'package:flutter_boilerplate/environment/config/staging_config.dart';

class Environment {
  static const String dev = 'dev';
  static const String staging = 'staging';
  static const String prod = 'prod';

  late BaseConfig config;

  Environment(String? flavor) {
    config = _getConfig(flavor);
  }

  BaseConfig _getConfig(String? environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.staging:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
