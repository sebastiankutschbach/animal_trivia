part of 'animal_bloc.dart';

@freezed
class AnimalEvent with _$AnimalEvent {
  const factory AnimalEvent.randomAnimalRequested() = RandomAnimalRequested;
}
