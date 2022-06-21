import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/flavor/flavor_config.dart';

class DevConfig extends FlavorConfig {
  @override
  String get apiHost => 'myjson.dit.upm.es';

  @override
  bool get useHttps => false;

  @override
  String get apiPath => '/api/bins/';

  @override
  Color get color => Colors.blue;

  @override
  String? get name => 'Dev';
}
