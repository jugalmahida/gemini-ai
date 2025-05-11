part of 'ask_ai_bloc.dart';

abstract class AskAiState extends Equatable {
  final List<Message> messages;

  const AskAiState({this.messages = const []});

  @override
  List<Object?> get props => [messages];
}

class AskAiInitial extends AskAiState {
  const AskAiInitial() : super(messages: const []);
}

class AskAiLoading extends AskAiState {
  const AskAiLoading({required super.messages});
}

class AskAiLoaded extends AskAiState {
  const AskAiLoaded({required super.messages});
}

class AskAiError extends AskAiState {
  final String error;

  const AskAiError({required this.error, required super.messages});

  @override
  List<Object?> get props => [error, messages];
}

