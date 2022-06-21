import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/constants/app_theme.dart';
import 'package:flutter_boilerplate/domain/flavor/flavor_config.dart';
import 'package:flutter_boilerplate/presentation/di/locator.dart';
import 'package:flutter_boilerplate/presentation/route/app_route.dart';
import 'package:flutter_boilerplate/widgets/flavor_banner.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_boilerplate/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final config = locator<FlavorConfig>();
    return FlavorBanner(
      color: config.color,
      name: config.name,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: themeData,
        routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
        routeInformationParser: const RoutemasterParser(),
      ),
    );
  }
}
