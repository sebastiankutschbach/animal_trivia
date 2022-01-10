import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import '../../sample_responses.dart';

class MockIAnimalRepository extends Mock implements IAnimalRepository {}

class MockTranslateService extends Mock implements TranslateService {}

main() {
  final Animal defaultAnimal =
      AnimalDto.fromJson(sampleAnimalResponse1).toDomain();
  blocTest<AnimalBloc, AnimalState>(
    'emits [Loading, Loaded] when AnimalEvent.randomAnimalRequested() is added and loading was successful',
    build: () {
      final IAnimalRepository animalRepository = MockIAnimalRepository();
      final TranslateService translateService = MockTranslateService();
      when(() => animalRepository.getRandonAnimals())
          .thenAnswer((_) async => right([defaultAnimal]));
      when(
        () => translateService.translate(
          any(),
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer(
        (invocation) async => right(invocation.positionalArguments.first),
      );
      return AnimalBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(const AnimalEvent.randomAnimalRequested()),
    expect: () => <AnimalState>[AnimalLoading(), AnimalLoaded(defaultAnimal)],
  );

  final Failure failure = Failure(message: 'message');
  blocTest<AnimalBloc, AnimalState>(
    'emits [Loading, LoadError] when AnimalEvent.randomAnimalRequested() is added and loading was NOT successful',
    build: () {
      final IAnimalRepository animalRepository = MockIAnimalRepository();
      final TranslateService translateService = MockTranslateService();

      when(() => animalRepository.getRandonAnimals())
          .thenAnswer((_) async => left(failure));
      when(
        () => translateService.translate(
          any(),
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer(
        (invocation) async => right(invocation.positionalArguments.first),
      );
      return AnimalBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(const AnimalEvent.randomAnimalRequested()),
    expect: () => <AnimalState>[AnimalLoading(), AnimalLoadError(failure)],
  );
}
