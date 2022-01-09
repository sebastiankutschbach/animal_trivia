part of 'animal_bloc.dart';

abstract class AnimalState extends Equatable {}

class AnimalInitial extends AnimalState {
  @override
  List<Object?> get props => [];
}

class AnimalLoading extends AnimalState {
  @override
  List<Object?> get props => [];
}

class AnimalLoadError extends AnimalState {
  final Failure failure;

  AnimalLoadError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class AnimalLoaded extends AnimalState {
  final Animal animal;

  AnimalLoaded(this.animal);

  @override
  List<Object?> get props => [animal];
}
