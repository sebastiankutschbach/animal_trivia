part of 'trivia_page_bloc.dart';

abstract class TriviaPageState extends Equatable {}

class AnimalInitial extends TriviaPageState {
  @override
  List<Object?> get props => [];
}

class AnimalLoading extends TriviaPageState {
  @override
  List<Object?> get props => [];
}

class AnimalLoadError extends TriviaPageState {
  final Failure failure;

  AnimalLoadError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class AnimalLoaded extends TriviaPageState {
  final Animal animal;

  AnimalLoaded(this.animal);

  @override
  List<Object?> get props => [animal];
}
