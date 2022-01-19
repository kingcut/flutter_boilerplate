import 'package:flutter_boilerplate/data/di/locator.dart';

class Data {
  static Future init(String? flavor) async {
    await setupLocator(flavor);
  }
}
