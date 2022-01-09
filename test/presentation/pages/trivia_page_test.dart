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
import 'package:network_image_mock/network_image_mock.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../infrastructure/repository/animal/animal_dto_test.dart';

class MockAnimalBloc extends MockBloc<AnimalEvent, AnimalState>
    implements AnimalBloc {}

main() {
  final Animal defaultAnimal =
      AnimalDto.fromJson(sampleAnimalResponse).toDomain();

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
      mockNetworkImagesFor(() async {
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
      mockNetworkImagesFor(() async {
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
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        _findTextInAppBar('Siamang');
      });
    });

    testWidgets('shows image of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);
      });
    });

    testWidgets('shows latin name of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.latinName), findsOneWidget);
      });
    });

    testWidgets('shows type of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.aninmalType), findsOneWidget);
      });
    });

    testWidgets('shows active time of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.activeTime), findsOneWidget);
      });
    });

    testWidgets('shows habitat time of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.habitat), findsOneWidget);
      });
    });

    testWidgets('shows diet of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.diet), findsOneWidget);
      });
    });

    testWidgets('shows geo range of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.geoRange), findsOneWidget);
      });
    });

    testWidgets('shows min length of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.lengthMin.toString()), findsOneWidget);
      });
    });

    testWidgets('shows max length of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.lengthMax.toString()), findsOneWidget);
      });
    });

    testWidgets('shows min weight of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.weightMin.toString()), findsOneWidget);
      });
    });

    testWidgets('shows max weight of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.weightMax.toString()), findsOneWidget);
      });
    });

    testWidgets('shows lifespan of the animal after loading',
        (WidgetTester tester) async {
      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          _createApp(animal: defaultAnimal),
        );

        await tester.pumpAndSettle();

        expect(find.text(defaultAnimal.lifespan.toString()), findsOneWidget);
      });
    });
  });
}
