import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
      : super(AnimalState.initial()) {
    on<RandomAnimalRequested>((event, emit) async {
      await animalRepository.getRandonAnimal().then(
            (animal) => animal.fold(
              (l) => emit(
                state.copyWith(
                  animal: some(animal),
                ),
              ),
              (r) async {
                final translatedAnimal = await r.translatedAndConverted(
                    translateService,
                    from: 'en',
                    to: 'de');
                emit(
                  state.copyWith(
                    animal: some(
                      right(translatedAnimal),
                    ),
                  ),
                );
              },
            ),
          );
    });
  }
}

extension Translation on Animal {
  Future<Animal> translatedAndConverted(TranslateService translateService,
      {required String from, required String to}) async {
    return copyWith(
      name: await getTranslationOrFallback(translateService, name,
          from: from, to: to),
      aninmalType: await getTranslationOrFallback(translateService, aninmalType,
          from: from, to: to),
      habitat: await getTranslationOrFallback(translateService, habitat,
          from: from, to: to),
      diet: await getTranslationOrFallback(translateService, diet,
          from: from, to: to),
      geoRange: await getTranslationOrFallback(translateService, geoRange,
          from: from, to: to),
    );
  }

  Future<String> getTranslationOrFallback(
      TranslateService translateService, String text,
      {required String from, required String to}) async {
    final result = await translateService.translate(text, from: from, to: to);
    return result.fold(
        (failure) => text, (translation) => '$translation ($text)');
  }
}
