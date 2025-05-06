part of 'ask_ai_bloc.dart';

sealed class AskAiEvent extends Equatable {
  const AskAiEvent();

  @override
  List<Object> get props => [];
}

class AskAIQuery extends AskAiEvent{
  final String query;
  const AskAIQuery(this.query);
}
