import 'dart:math';

import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/pages/quiz_page.dart';
import 'package:animal_trivia/presentation/widgets/animal_detail_widget.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../mocks.dart';
import '../../sample_responses.dart';

main() async {
  final List<Animal> defaultAnimals = List<Animal>.from(
    sampleAnimalBatchResponse.map(
      (animalResponse) => AnimalDto.fromJson(sampleAnimalResponse1).toDomain(),
    ),
  );

  await EasyLocalization.ensureInitialized();

  Future<Widget> _createApp(
      {Failure? failure, List<Animal> animals = const []}) async {
    final quizPageBloc = MockQuizPageBloc();

    when(() => quizPageBloc.animalToGuessIndex).thenReturn(0);

    if (failure != null) {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageError(failure));
    } else if (animals.isNotEmpty) {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageLoaded(animals));
    } else {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageLoading());
    }

    getIt.allowReassignment = true;
    getIt.registerSingleton<QuizPageBloc>(quizPageBloc);

    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MaterialApp(
        home: QuizPage(),
      ),
    );
  }

  group('loading state', () {
    testWidgets('shows loading state while loading random animals',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(),
        );

        expect(find.byType(LoadingScaffold), findsOneWidget);
      });
    });
  });

  group('error state', () {
    testWidgets('shows error state when loading random animals failed',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(
            failure: Failure(message: 'error'),
          ),
        );

        expect(find.byType(ErrorScaffold), findsOneWidget);
      });
    });
  });

  group('success state', () {
    testWidgets('shows success state when loading random animals suceeded',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animals: defaultAnimals),
        );

        expect(find.byType(PageView), findsOneWidget);
        expect(find.byType(AnimalDetail), findsOneWidget);
      });
    });

    // testWidgets(
    //     'shows snackbar (containing correct) when correct animal was selected',
    //     (WidgetTester tester) async {
    //   await mockNetworkImages(() async {
    //     await tester.pumpWidget(
    //       await _createApp(animals: defaultAnimals),
    //     );

    //     await tester.tap(find.byType(FloatingActionButton));
    //     await tester.pumpAndSettle();

    //     final snackBarFinder = find.byType(SnackBar);
    //     expect(snackBarFinder, findsOneWidget);
    //     expect(
    //         find.descendant(
    //             of: snackBarFinder,
    //             matching: find.textContaining('Correct Answer!')),
    //         findsOneWidget);
    //   });
    // });

    // testWidgets(
    //     'shows snackbar (containing correct) when correct animal was selected',
    //     (WidgetTester tester) async {
    //   await mockNetworkImages(() async {
    //     await tester.pumpWidget(
    //       await _createApp(animals: defaultAnimals),
    //     );

    //     await tester.tap(find.byType(FloatingActionButton));
    //     await tester.pumpAndSettle();

    //     final snackBarFinder = find.byType(SnackBar);
    //     expect(snackBarFinder, findsOneWidget);
    //     expect(
    //         find.descendant(
    //             of: snackBarFinder,
    //             matching: find.textContaining('Correct Answer!')),
    //         findsOneWidget);
    //   });
    });
  });
}
