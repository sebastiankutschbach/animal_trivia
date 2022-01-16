import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:animal_trivia/injection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUpAll(() => configureDependencies());

  group('dependency injection', () {
    test('QuizPageBloc', () {
      expect(getIt<QuizPageBloc>(), isNotNull);
    });

    test('TriviaPageBloc', () {
      expect(getIt<TriviaPageBloc>(), isNotNull);
    });

    test('IAnimalRepository', () {
      expect(getIt<IAnimalRepository>(), isNotNull);
    });

    test('Dio', () {
      expect(getIt<Dio>(), isNotNull);
    });
  });
}
