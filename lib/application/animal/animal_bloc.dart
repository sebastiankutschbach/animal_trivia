import 'dart:developer';

import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'animal_event.dart';
part 'animal_state.dart';
part 'animal_bloc.freezed.dart';

@Injectable()
class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  final IAnimalRepository animalRepository;

  final TranslateService translateService;

  AnimalBloc(this.animalRepository, this.translateService)
      : super(AnimalInitial()) {
    on<RandomAnimalRequested>((event, emit) async {
      emit(AnimalLoading());
      await animalRepository.getRandonAnimal().then(
            (animal) => animal.fold(
              (failure) => emit(AnimalLoadError(failure)),
              (animal) async {
                final translatedAnimal = await animal.translatedAndConverted(
                    translateService,
                    from: 'en',
                    to: 'de');
                emit(AnimalLoaded(translatedAnimal));
              },
            ),
          );
    });
  }
}

extension Translation on Animal {
  Future<Animal> translatedAndConverted(TranslateService translateService,
      {required String from, required String to}) async {
    final toBeTranslated = [
      name,
      activeTime,
      aninmalType,
      habitat,
      diet,
      geoRange
    ];
    log("Before: $toBeTranslated");
    final List<String> translations = await getTranslationOrFallback(
        translateService, toBeTranslated,
        from: from, to: to);

    log("After: $translations");
    return copyWith(
      name: translations[0],
      activeTime: translations[1],
      aninmalType: translations[2],
      habitat: translations[3],
      diet: translations[4],
      geoRange: translations[5],
    );
  }

  Future<List<String>> getTranslationOrFallback(
      TranslateService translateService, List<String> texts,
      {required String from, required String to}) async {
    final result = await translateService.translate(texts, from: from, to: to);
    return result.fold((failure) => texts, (translation) => translation);
  }
}
