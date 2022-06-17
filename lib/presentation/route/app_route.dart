import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/home/home_page.dart';
import 'package:flutter_boilerplate/presentation/pages/unknown/unknown_page.dart';
import 'package:routemaster/routemaster.dart';

final routes = RouteMap(
  onUnknownRoute: (path) {
    return MaterialPage(
      child: UnknownPage(
        path: path,
      ),
    );
  },
  routes: {
    '/': (_) => const MaterialPage(child: HomePage()),
    '/unknown': (route) => MaterialPage(
          child: UnknownPage(
            path: route.fullPath,
          ),
        ),
  },
);
