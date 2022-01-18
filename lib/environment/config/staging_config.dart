import 'package:flutter_boilerplate/environment/config/base_config.dart';

class StagingConfig extends BaseConfig {
  @override
  String get apiHost => 'myjson.dit.upm.es';

  @override
  bool get useHttps => false;

  @override
  String get apiPath => '/api/bins/58wl';
}
