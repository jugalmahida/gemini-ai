import 'package:gemini/domain/entities/ai_model.dart';

abstract class AiRepository {
  Future<AIModel?> askAI(String query);
}
