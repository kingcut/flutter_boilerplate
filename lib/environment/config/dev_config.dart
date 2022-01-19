import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/environment/config/base_config.dart';

class DevConfig extends BaseConfig {
  @override
  String get apiHost => 'myjson.dit.upm.es';

  @override
  bool get useHttps => false;

  @override
  String get apiPath => '/api/bins/58wl';

  @override
  Color get color => Colors.blue;

  @override
  String? get name => 'Dev';
}
