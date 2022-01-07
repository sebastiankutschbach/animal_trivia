import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'trivia_page_test.mocks.dart';

@GenerateMocks([IAnimalRepository])
main() {
  Widget createApp(IAnimalRepository animalRepository) => BlocProvider(
        create: (context) => AnimalBloc(animalRepository),
        child: const MaterialApp(
          home: TriviaPage(),
        ),
      );

  group('loading state', () {
    testWidgets('shows loading state while loading random animal',
        (WidgetTester tester) async {
      final animalRepository = MockIAnimalRepository();
      when(animalRepository.getRandonAnimal()).thenAnswer(
        (_) async => Future.delayed(
          const Duration(seconds: 1),
          () => left(
            Failure(),
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
          Failure(),
        ),
      );
      await tester.pumpWidget(
        createApp(animalRepository),
      );

      await tester.pumpAndSettle();

      expect(find.text('Error'), findsOneWidget);
    });
  });
}
