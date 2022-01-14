import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/pages/quiz_page.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../mocks.dart';

main() {
  Widget _createApp({Failure? failure, List<Animal> animals = const []}) {
    final quizPageBloc = MockQuizPageBloc();

    if (failure != null) {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageError(failure));
    } else if (animals.isNotEmpty) {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageLoaded(animals));
    } else {
      when(() => quizPageBloc.state).thenAnswer((_) => QuizPageLoading());
    }

    getIt.allowReassignment = true;
    getIt.registerSingleton<QuizPageBloc>(quizPageBloc);

    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: QuizPage(),
    );
  }

  group('loading state', () {
    testWidgets('shows loading state while loading random animals',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          _createApp(),
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
          _createApp(
            failure: Failure(message: 'error'),
          ),
        );

        expect(find.byType(ErrorScaffold), findsOneWidget);
      });
    });
  });
}
