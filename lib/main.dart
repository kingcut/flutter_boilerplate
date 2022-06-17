import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/presentation/app/my_app.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';

Future<void> main() async {
  // add this, and it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();
  final String? flavor =
      await const MethodChannel('flavor').invokeMethod<String>('getFlavor');

  // Set orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    await setupLocator(flavor);
    runApp(const MyApp());
  });
}
