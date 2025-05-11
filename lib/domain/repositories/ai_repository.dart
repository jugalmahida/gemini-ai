import 'package:gemini/domain/entities/message.dart';

abstract class AiRepository {
  Future<Message>? askAI(String query);
}
