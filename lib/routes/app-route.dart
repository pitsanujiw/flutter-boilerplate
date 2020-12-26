import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/screens.dart';
import 'package:flutter_boilerplate/screens/splash-screen/splash-screen.dart';

class AppRoute extends NavigatorObserver {
  AppRoute._internal();
  static final AppRoute _appRoute = AppRoute._internal();
  factory AppRoute() => _appRoute;

  static final Map<String,
      Widget Function(BuildContext context, dynamic arguments)> _routes = {
    SplashScreen.ROUTE_NAME: (_, arguments) => SplashScreen(),
    HomeScreen.ROUTE_NAME: (_, arguments) => HomeScreen(),
  };
  Map<String, Widget Function(BuildContext context, dynamic arguments)>
      get routes => _routes;
}

AppRoute appRoute = AppRoute();
