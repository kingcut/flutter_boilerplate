import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/presentation/pages/home/home_page.dart';
import 'package:flutter_boilerplate/presentation/pages/unknown/unknown_page.dart';
import 'package:routemaster/routemaster.dart';

const homeRoute = '/';
const unknownRoute = '/unknown';

final routes = RouteMap(
  onUnknownRoute: (path) {
    return MaterialPage(
      child: UnknownPage(
        path: path,
      ),
    );
  },
  routes: {
    homeRoute: (_) => const MaterialPage(child: HomePage()),
    unknownRoute: (route) => MaterialPage(
          child: UnknownPage(
            path: route.fullPath,
          ),
        ),
  },
);
