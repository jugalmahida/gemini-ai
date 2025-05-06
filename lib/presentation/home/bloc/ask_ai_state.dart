part of 'ask_ai_bloc.dart';

sealed class AskAiState extends Equatable {
  const AskAiState();

  @override
  List<Object> get props => [];
}

final class AskAiInitial extends AskAiState {}

final class AskAiLoading extends AskAiState {}

final class AskAiLoaded extends AskAiState {
  final AIModel? data;
  const AskAiLoaded(this.data);
  @override
  List<Object> get props => [data ?? {}]; // Added props override
}

final class AskAiError extends AskAiState {
  final String message; // Added error message field

  const AskAiError(this.message); // Added const constructor

  @override
  List<Object> get props => [message]; // Added props override
}
