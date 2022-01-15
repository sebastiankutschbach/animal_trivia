import 'dart:io';

import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'trivia_page_event.dart';
part 'trivia_page_state.dart';
part 'trivia_page_bloc.freezed.dart';

@Injectable()
class TriviaPageBloc extends Bloc<TriviaPageEvent, TriviaPageState> {
  final IAnimalRepository animalRepository;

  final TranslateService translateService;

  TriviaPageBloc(this.animalRepository, this.translateService)
      : super(TriviaPageInitial()) {
    on<RandomAnimalRequested>((event, emit) async {
      emit(TriviaPageLoading());
      await animalRepository.getRandonAnimals().then(
            (animal) => animal.fold(
              (failure) => emit(TriviaPageError(failure)),
              (animal) async {
                final translatedAnimal = await Animal.translateAndConvert(
                    animal.first, translateService,
                    from: 'en', to: Platform.localeName.split('_').first);
                emit(
                  TriviaPageLoaded(translatedAnimal),
                );
              },
            ),
          );
    });
  }
}
