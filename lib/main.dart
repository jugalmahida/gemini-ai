import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/core/routes/routes.dart';
import 'package:gemini/core/utils/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gemini",
      initialRoute: AppRoutes.initial,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenrateRoute,
    );
  }
}
