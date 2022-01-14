part of 'trivia_page_bloc.dart';

abstract class TriviaPageState extends Equatable {}

class TriviaPageInitial extends TriviaPageState {
  @override
  List<Object?> get props => [];
}

class TriviaPageLoading extends TriviaPageState {
  @override
  List<Object?> get props => [];
}

class TriviaPageError extends TriviaPageState {
  final Failure failure;

  TriviaPageError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class TriviaPageLoaded extends TriviaPageState {
  final Animal animal;

  TriviaPageLoaded(this.animal);

  @override
  List<Object?> get props => [animal];
}
