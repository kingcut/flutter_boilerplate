import 'dart:ui';

abstract class BaseConfig {
  String? get name;

  Color get color;

  String get apiHost;

  String get apiPath;

  bool get useHttps;

  Map<String, Object> toMap() {
    return {
      'apiHost': apiHost,
      'useHttps': useHttps,
      'apiPath': apiPath,
    };
  }
}
