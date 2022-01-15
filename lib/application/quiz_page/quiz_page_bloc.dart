import 'dart:io';
import 'dart:math';

import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'quiz_page_event.dart';
part 'quiz_page_state.dart';
part 'quiz_page_bloc.freezed.dart';

@Injectable()
class QuizPageBloc extends Bloc<QuizPageEvent, QuizPageState> {
  final IAnimalRepository animalRepository;
  final TranslateService translateService;
  int animalToGuessIndex = 0;

  QuizPageBloc(this.animalRepository, this.translateService)
      : super(QuizPageInitial()) {
    on<RandomAnimalsRequested>((event, emit) async {
      emit(QuizPageLoading());
      await animalRepository.getRandonAnimals(noOfAnimals: 3).then(
            (result) => result.fold((failure) => emit(QuizPageError(failure)),
                (animals) async {
              animalToGuessIndex = Random.secure().nextInt(animals.length - 1);
              final List<Animal> translatedAnimals = await Future.wait(
                animals.map<Future<Animal>>(
                  (animal) async => await Animal.translateAndConvert(
                      animal, translateService,
                      from: 'en', to: Platform.localeName.split('_').first),
                ),
              );
              emit(
                QuizPageLoaded(translatedAnimals),
              );
            }),
          );
    });
    on<AnimalSelected>((event, emit) async {
      emit(
        QuizPageAnimalSelected(animalToGuessIndex == event.index),
      );
      await Future.delayed(
        const Duration(seconds: 1),
        () => add(
          const QuizPageEvent.randomAnimalsRequested(),
        ),
      );
    });
  }
}
