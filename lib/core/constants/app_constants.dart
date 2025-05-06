import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const String appName = 'My Gemini App';
  static const String apiBaseUrl =
      'https://generativelanguage.googleapis.com/v1beta/';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
}
