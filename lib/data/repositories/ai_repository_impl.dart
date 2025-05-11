import 'dart:developer';

import 'package:gemini/core/constants/app_constants.dart';
import 'package:gemini/data/services/api_client.dart';
import 'package:gemini/domain/entities/ai_model.dart';
import 'package:gemini/domain/entities/message.dart';
import 'package:gemini/domain/repositories/ai_repository.dart';

class AiRepositoryImpl implements AiRepository {
  final ApiClient _apiService;

  AiRepositoryImpl({required ApiClient apiClient}) : _apiService = apiClient;

  @override
  Future<Message> askAI(String query) async {
    try {
      Map<String, dynamic> payload = {
        "contents": [
          {
            "parts": [
              {
                "text": query,
              }
            ]
          }
        ]
      };
      final res = await _apiService.post(
        "/models/gemini-2.0-flash:generateContent?key=${AppConstants.apiKey}",
        data: payload,
      );
      log("API res - ${res.data}");
      final AIModel data = AIModel.fromJson(res.data);

      // Create and return a single message
      return Message(userQuery: query, resData: data);
    } catch (error) {
      log("Error - $error");
      throw Exception("Failed to get AI response: $error");
    }
  }
}
