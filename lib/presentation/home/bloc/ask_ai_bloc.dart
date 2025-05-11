import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini/domain/entities/message.dart';
import 'package:gemini/domain/repositories/ai_repository.dart';

part 'ask_ai_event.dart';
part 'ask_ai_state.dart';

class AskAiBloc extends Bloc<AskAiEvent, AskAiState> {
  final AiRepository repository;

  AskAiBloc(this.repository) : super(const AskAiInitial()) {
    on<AskAIQuery>(_askAIQuery);
    // on<ClearMessages>(_clearMessages);
  }

  Future<void> _askAIQuery(AskAIQuery event, Emitter<AskAiState> emit) async {
    // First emit loading state while preserving previous messages
    emit(AskAiLoading(messages: state.messages));

    try {
      // Call the repository to get AI response
      final response = await repository.askAI(event.query);

      if (response != null) {
        // Create a new list with all previous messages plus the new one
        final updatedMessages = List<Message>.from(state.messages)
          ..add(response);
        emit(AskAiLoaded(messages: updatedMessages));
      } else {
        emit(AskAiError(
            error: "Failed to get response", messages: state.messages));
      }
    } catch (e) {
      emit(AskAiError(error: e.toString(), messages: state.messages));
    }
  }

  // void _clearMessages(ClearMessages event, Emitter<AskAiState> emit) {
  //   emit(const AskAiInitial());
  // }
}
