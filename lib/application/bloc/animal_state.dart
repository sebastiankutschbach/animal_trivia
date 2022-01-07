part of 'animal_bloc.dart';

@freezed
class AnimalState with _$AnimalState {
  factory AnimalState(
      {required Option<Either<IFailure, Animal>> animal,
      required bool isLoading,
      required bool isError}) = _AnimalState;

  factory AnimalState.initial() =>
      AnimalState(animal: none(), isLoading: false, isError: false);
}
