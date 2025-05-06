import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gemini/domain/entities/ai_model.dart';
import 'package:gemini/domain/repositories/ai_repository.dart';

part 'ask_ai_event.dart';
part 'ask_ai_state.dart';

class AskAiBloc extends Bloc<AskAiEvent, AskAiState> {
  final AiRepository repository;

  AskAiBloc(this.repository) : super(AskAiInitial()) {
    on<AskAIQuery>(_askAIQuery);
  }

  Future<void> _askAIQuery(AskAIQuery event, Emitter<AskAiState> emit) async {
    emit(AskAiLoading());
    try { 
      final response = await repository.askAI(event.query);
      emit(AskAiLoaded(response));
    } catch (e) {
      emit(AskAiError(e.toString()));
    }
  }
}
