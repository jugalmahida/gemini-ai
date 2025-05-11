part of 'ask_ai_bloc.dart';

abstract class AskAiEvent extends Equatable {
  const AskAiEvent();

  @override
  List<Object?> get props => [];
}

class AskAIQuery extends AskAiEvent {
  final String query;

  const AskAIQuery(this.query);

  @override
  List<Object?> get props => [query];
}

// class ClearMessages extends AskAiEvent {}
