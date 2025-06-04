import 'package:flutter/material.dart';
import 'package:gemini/presentation/home/page/home.dart';
import 'package:gemini/presentation/splash/page/splashscreen.dart';

class AppRoutes {
  static const String initial = '/';
  static const String home = '/home';

  static Route<dynamic> onGenrateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
