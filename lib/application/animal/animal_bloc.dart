import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_event.dart';
part 'animal_state.dart';
part 'animal_bloc.freezed.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  IAnimalRepository animalRepository;

  AnimalBloc(this.animalRepository) : super(AnimalState.initial()) {
    on<RandomAnimalRequested>((event, emit) async {
      await animalRepository.getRandonAnimal().then(
            (animal) => emit(
              state.copyWith(animal: some(animal)),
            ),
          );
    });
  }
}
