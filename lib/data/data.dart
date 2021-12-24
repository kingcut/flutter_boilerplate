import 'package:flutter_boilerplate/data/di/locator.dart';

class Data {
  static Future init() async {
    await setupLocator();
  }
}
