import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/domain/flavor/flavor_config.dart';

class ProdConfig extends FlavorConfig {
  @override
  String get apiHost => 'myjson.dit.upm.es';

  @override
  bool get useHttps => false;

  @override
  String get apiPath => '/api/bins/58wl';

  @override
  Color get color => Colors.red;

  @override
  String? get name => null;
}
