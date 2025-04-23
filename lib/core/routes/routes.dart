import 'package:flutter/material.dart';
import 'package:gemini/presentation/home/page/home.dart';

class AppRoutes {
  static const String initial = '/';

  static Route<dynamic> onGenrateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;

    switch (routeSettings.name) {
      case initial:
        return MaterialPageRoute(builder: (_) => Home());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
