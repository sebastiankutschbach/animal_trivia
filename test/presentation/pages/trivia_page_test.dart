import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import '../../sample_responses.dart';

class MockAnimalBloc extends MockBloc<AnimalEvent, AnimalState>
    implements AnimalBloc {}

main() {
  final Animal defaultAnimal =
      AnimalDto.fromJson(sampleAnimalResponse1).toDomain();

  Widget _createApp({Failure? failure, Animal? animal}) {
    final animalBloc = MockAnimalBloc();

    if (failure != null) {
      when(() => animalBloc.state).thenAnswer((_) => AnimalLoadError(failure));
    } else if (animal != null) {
      when(() => animalBloc.state).thenAnswer((_) => AnimalLoaded(animal));
    } else {
      when(() => animalBloc.state).thenAnswer((_) => AnimalLoading());
    }

    getIt.allowReassignment = true;
    getIt.registerSingleton<AnimalBloc>(animalBloc);

    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: TriviaPage(),
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
          _createApp(),
        );

        _findTextInAppBar('Loading');
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
        await tester.pump(
          const Duration(seconds: 1),
        );
      });
    });
  });

  group('error state', () {
    testWidgets('shows error state when loading random animal failed',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          _createApp(
            failure: Failure(message: 'error'),
          ),
        );

        await tester.pumpAndSettle();

        _findTextInAppBar('Error');
        expect(find.byIcon(Icons.error), findsOneWidget);
      });
    });
  });

  group('success state', () {
    testWidgets('shows name of the animal in app bar after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        _findTextInAppBar('Siamang');
      });
    });

    testWidgets('shows latin name of the animal after loading',
        (WidgetTester tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
          _createApp(animal: defaultAnimal),
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
