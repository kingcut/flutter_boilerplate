import 'dart:ui';

abstract class FlavorConfig {
  String? get name;

  Color get color;

  String get apiHost;

  String get apiPath;

  bool get useHttps;
}
