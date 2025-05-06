import 'package:gemini/data/repositories/ai_repository_impl.dart';
import 'package:gemini/data/services/api_client.dart';
import 'package:gemini/domain/repositories/ai_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<AiRepository>(
      AiRepositoryImpl(apiClient: ApiClient()));
}
