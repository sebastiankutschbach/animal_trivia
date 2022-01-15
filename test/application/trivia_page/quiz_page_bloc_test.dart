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

  _createBloc({Failure? failure}) {
    final IAnimalRepository animalRepository = MockIAnimalRepository();
    final TranslateService translateService = MockTranslateService();

    when(
      () => animalRepository.getRandonAnimals(noOfAnimals: 3),
    ).thenAnswer(
      (_) async => failure == null ? right(defaultAnimals) : left(failure),
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
  }

  blocTest<QuizPageBloc, QuizPageState>(
    'emits [Loading, Loaded] when QuizPageEvent.randomAnimalRequested() is added and loading was successful',
    build: () => _createBloc(),
    act: (bloc) => bloc.add(const QuizPageEvent.randomAnimalsRequested()),
    expect: () =>
        <QuizPageState>[QuizPageLoading(), QuizPageLoaded(defaultAnimals)],
  );

  blocTest<QuizPageBloc, QuizPageState>(
    'emits [AnimalSelected(true)] when QuizPageEvent.animalSelected() is added and guess was correct',
    build: () => _createBloc()..animalToGuessIndex = 0,
    seed: () => QuizPageLoaded(defaultAnimals),
    act: (bloc) => bloc.add(const QuizPageEvent.animalSelected(0)),
    expect: () => <QuizPageState>[
      QuizPageAnimalSelected(true, defaultAnimals[0]),
    ],
  );

  blocTest<QuizPageBloc, QuizPageState>(
    'emits [AnimalSelected(true)] when QuizPageEvent.animalSelected() is added and guess was incorrect',
    build: () => _createBloc()..animalToGuessIndex = 0,
    seed: () => QuizPageLoaded(defaultAnimals),
    act: (bloc) => bloc.add(const QuizPageEvent.animalSelected(1)),
    expect: () => <QuizPageState>[
      QuizPageAnimalSelected(false, defaultAnimals[0]),
    ],
  );

  final Failure failure = Failure(message: 'message');
  blocTest<QuizPageBloc, QuizPageState>(
    'emits [Loading, LoadError] when QuizPageEvent.randomAnimalRequested() is added and loading was NOT successful',
    build: () => _createBloc(failure: failure),
    act: (bloc) => bloc.add(
      const QuizPageEvent.randomAnimalsRequested(),
    ),
    expect: () => <QuizPageState>[QuizPageLoading(), QuizPageError(failure)],
  );
}
