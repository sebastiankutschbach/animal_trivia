import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
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
  final List<Animal> defaultAnimals = List<Animal>.from(
    sampleAnimalBatchResponse.map(
      (animalResponse) => AnimalDto.fromJson(sampleAnimalResponse1).toDomain(),
    ),
  );

  blocTest<QuizPageBloc, QuizPageState>(
    'emits [Loading, Loaded] when AnimalEvent.randomAnimalRequested() is added and loading was successful',
    build: () {
      final IAnimalRepository animalRepository = MockIAnimalRepository();
      final TranslateService translateService = MockTranslateService();

      when(
        () => animalRepository.getRandonAnimals(noOfAnimals: 3),
      ).thenAnswer(
        (_) async => right(defaultAnimals),
      );
      when(
        () => translateService.translate(
          any(),
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer(
        (invocation) async => right(invocation.positionalArguments.first),
      );

      return QuizPageBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(const QuizPageEvent.randomAnimalsRequested()),
    expect: () =>
        <QuizPageState>[QuizPageLoading(), QuizPageLoaded(defaultAnimals)],
  );

  final Failure failure = Failure(message: 'message');
  blocTest<QuizPageBloc, QuizPageState>(
    'emits [Loading, LoadError] when AnimalEvent.randomAnimalRequested() is added and loading was NOT successful',
    build: () {
      final IAnimalRepository animalRepository = MockIAnimalRepository();
      final TranslateService translateService = MockTranslateService();

      when(
        () => animalRepository.getRandonAnimals(noOfAnimals: 3),
      ).thenAnswer(
        (_) async => left(failure),
      );

      when(
        () => translateService.translate(
          any(),
          from: any(named: 'from'),
          to: any(named: 'to'),
        ),
      ).thenAnswer(
        (invocation) async => right(invocation.positionalArguments.first),
      );

      return QuizPageBloc(animalRepository, translateService);
    },
    act: (bloc) => bloc.add(
      const QuizPageEvent.randomAnimalsRequested(),
    ),
    expect: () => <QuizPageState>[QuizPageLoading(), QuizPageError(failure)],
  );
}