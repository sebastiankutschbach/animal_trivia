import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../infrastructure/repository/animal/animal_dto_test.dart';
import 'trivia_page_test.mocks.dart';

@GenerateMocks([IAnimalRepository])
main() {
  Widget createApp(IAnimalRepository animalRepository) {
    final animalBloc = AnimalBloc(animalRepository);
    getIt.registerSingleton(animalBloc);

    return const MaterialApp(
      home: TriviaPage(),
    );
  }

  group('loading state', () {
    testWidgets('shows loading state while loading random animal',
        (WidgetTester tester) async {
      final animalRepository = MockIAnimalRepository();
      when(animalRepository.getRandonAnimal()).thenAnswer(
        (_) async => Future.delayed(
          const Duration(seconds: 1),
          () => left(
            Failure(message: 'error'),
          ),
        ),
      );
      await tester.pumpWidget(
        createApp(animalRepository),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump(
        const Duration(seconds: 1),
      );
    });
  });

  group('error state', () {
    testWidgets('shows error state when loading random animal failed',
        (WidgetTester tester) async {
      final animalRepository = MockIAnimalRepository();
      when(animalRepository.getRandonAnimal()).thenAnswer(
        (_) async => left(
          Failure(message: 'Error'),
        ),
      );
      await tester.pumpWidget(
        createApp(animalRepository),
      );

      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.error), findsOneWidget);
    });
  });

  group('success state', () {
    testWidgets('shows name of the animal after loading random animal',
        (WidgetTester tester) async {
      final animalRepository = MockIAnimalRepository();
      when(animalRepository.getRandonAnimal()).thenAnswer(
        (_) async => right(
          AnimalDto.fromJson(sampleAnimalResponse).toDomain(),
        ),
      );
      await tester.pumpWidget(
        createApp(animalRepository),
      );

      await tester.pumpAndSettle();

      expect(find.text('Siamang'), findsOneWidget);
    });
  });
}
