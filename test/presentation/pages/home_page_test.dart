import 'package:animal_trivia/app_router.dart';
import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

main() async {
  late AppRouter _appRouter;
  await EasyLocalization.ensureInitialized();

  setUp(() {
    final triviaPageBloc = MockTriviaPageBloc();
    when(() => triviaPageBloc.state).thenAnswer((_) => TriviaPageLoading());
    getIt.allowReassignment = true;
    getIt.registerSingleton<TriviaPageBloc>(triviaPageBloc);
    _appRouter = AppRouter();
  });

  _createApp() async {
    final app = EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
    _appRouter.push(const HomeRoute());
    return app;
  }

  group('home entries', () {
    testWidgets('quiz entry', (WidgetTester tester) async {
      await tester.pumpWidget(await _createApp());

      expect(find.textContaining('QUIZ'), findsOneWidget);
    });

    testWidgets('trivia entry', (WidgetTester tester) async {
      await tester.pumpWidget(await _createApp());

      expect(find.textContaining('TRIVIA'), findsOneWidget);
    });

    group('click on home entries navigates to subpages', () {
      testWidgets('quiz entry', (WidgetTester tester) async {
        await tester.pumpWidget(await _createApp());

        await tester.tap(find.textContaining('QUIZ'));

        expect(_appRouter.current.name, QuizRoute.name);
      });

      testWidgets('trivia entry', (WidgetTester tester) async {
        await tester.pumpWidget(await _createApp());

        await tester.tap(find.textContaining('TRIVIA'));

        expect(_appRouter.current.name, TriviaRoute.name);
      });
    });
  });
}
