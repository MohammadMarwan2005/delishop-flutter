part of 'lang_code_cubit.dart';

sealed class LangCodeState extends Equatable {
  const LangCodeState();
}

final class LangCodeInitial extends LangCodeState {
  @override
  List<Object> get props => [];
}

final class LangCodeLoaded extends LangCodeState {
  final String? langCode;

  const LangCodeLoaded({required this.langCode});

  @override
  List<Object> get props => [langCode.toString()];
}