import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../mocks.dart';
import '../../sample_responses.dart';

main() {
  final Animal defaultAnimal =
      AnimalDto.fromJson(sampleAnimalResponse1).toDomain();

  Future<Widget> _createApp({Failure? failure, Animal? animal}) async {
    final triviaPageBloc = MockTriviaPageBloc();

    if (failure != null) {
      when(() => triviaPageBloc.state)
          .thenAnswer((_) => TriviaPageError(failure));
    } else if (animal != null) {
      when(() => triviaPageBloc.state)
          .thenAnswer((_) => TriviaPageLoaded(animal));
    } else {
      when(() => triviaPageBloc.state).thenAnswer((_) => TriviaPageLoading());
    }

    getIt.allowReassignment = true;
    getIt.registerSingleton<TriviaPageBloc>(triviaPageBloc);

    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    return EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MaterialApp(
        home: TriviaPage(),
      ),
    );
  }

  _findTextInAppBar(String text) {
    expect(
      find.descendant(
        of: find.byType(AppBar),
        matching: find.textContaining(text),
      ),
      findsOneWidget,
    );
  }

  group('loading state', () {
    testWidgets('shows loading state while loading random animal',
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
    testWidgets('shows error state when loading random animal failed',
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
    testWidgets('shows name of the animal in app bar after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        _findTextInAppBar('Siamang');
      });
    });

    testWidgets('shows latin name of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.latinName, skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows type of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.aninmalType, skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows active time of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.activeTime, skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows habitat time of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.habitat, skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows diet of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(
            find.text(defaultAnimal.diet, skipOffstage: false), findsOneWidget);
      });
    });

    testWidgets('shows geo range of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.geoRange, skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows length of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(
            find.textContaining(defaultAnimal.lengthMin.toStringAsFixed(2),
                skipOffstage: false),
            findsOneWidget);

        expect(
            find.textContaining(defaultAnimal.lengthMax.toStringAsFixed(2),
                skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows weight of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(
            find.textContaining(defaultAnimal.weightMin.toStringAsFixed(2),
                skipOffstage: false),
            findsOneWidget);

        expect(
            find.textContaining(defaultAnimal.weightMax.toStringAsFixed(2),
                skipOffstage: false),
            findsOneWidget);
      });
    });

    testWidgets('shows lifespan of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          await _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(
            find.textContaining(defaultAnimal.lifespan.toString(),
                skipOffstage: false),
            findsOneWidget);
      });
    });
  });
}
