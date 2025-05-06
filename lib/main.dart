import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini/core/routes/routes.dart';
import 'package:gemini/core/utils/app_bloc_observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gemini/domain/repositories/ai_repository.dart';
import 'package:gemini/presentation/home/bloc/ask_ai_bloc.dart';
import 'package:gemini/di/injection_container.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e'); // Print error if any
  }
  // Bloc Observer
  Bloc.observer = AppBlocObserver();
  // Setup DI
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AskAiBloc>(
      create: (_) => AskAiBloc(
        getIt<AiRepository>(),
      ),
      child: MaterialApp(
        title: "Gemini",
        initialRoute: AppRoutes.initial,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenrateRoute,
      ),
    );
  }
}
