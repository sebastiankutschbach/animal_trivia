part of 'animal_bloc.dart';

@freezed
class AnimalState with _$AnimalState {
  factory AnimalState({required Option<Either<Failure, Animal>> animal}) =
      _AnimalState;

  factory AnimalState.initial() => AnimalState(
        animal: none(),
      );
}
