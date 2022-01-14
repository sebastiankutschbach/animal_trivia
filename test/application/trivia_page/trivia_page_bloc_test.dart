import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../sample_responses.dart';

main() {
  final Animal defaultAnimal =
      AnimalDto.fromJson(sampleAnimalResponse1).toDomain();
  blocTest<TriviaPageBloc, TriviaPageState>(
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
      return TriviaPageBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(const TriviaPageEvent.randomAnimalRequested()),
    expect: () =>
        <TriviaPageState>[TriviaPageLoading(), TriviaPageLoaded(defaultAnimal)],
  );

  final Failure failure = Failure(message: 'message');
  blocTest<TriviaPageBloc, TriviaPageState>(
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
      return TriviaPageBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(const TriviaPageEvent.randomAnimalRequested()),
    expect: () =>
        <TriviaPageState>[TriviaPageLoading(), TriviaPageError(failure)],
  );
}
