part of 'quiz_page_bloc.dart';

abstract class QuizPageState extends Equatable {}

class QuizPageInitial extends QuizPageState {
  @override
  List<Object?> get props => [];
}

class QuizPageLoading extends QuizPageState {
  @override
  List<Object?> get props => [];
}

class QuizPageError extends QuizPageState {
  final Failure failure;

  QuizPageError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class QuizPageLoaded extends QuizPageState {
  final List<Animal> animals;

  QuizPageLoaded(this.animals);

  @override
  List<Object?> get props => [animals];
}

class QuizPageAnimalSelected extends QuizPageState {
  final bool result;

  QuizPageAnimalSelected(this.result);

  @override
  List<Object?> get props => [result];
}
