import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_repository.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../sample_responses.dart';

main() {
  group('get random animal', () {
    test('fetches random animal without error', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet('$getRandomAnimalPath/1',
          (server) => server.reply(200, [sampleAnimalResponse1]));

      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<Failure, List<Animal>> response =
          await animalRepository.getRandonAnimals();

      expect(response.isLeft(), false);
      expect(response.isRight(), true);
      expect(response.fold((l) => null, (r) => r), isA<List<Animal>>());
    });

    test('fetches random animal without error', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet('$getRandomAnimalPath/3',
          (server) => server.reply(200, sampleAnimalBatchResponse));

      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<Failure, List<Animal>> response =
          await animalRepository.getRandonAnimals(noOfAnimals: 3);

      expect(response.isLeft(), false);
      expect(response.isRight(), true);
      expect(response.fold((l) => null, (r) => r), isA<List<Animal>>());
    });

    test('returns failure when api does not return 200', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet(
          '$getRandomAnimalPath/3', (server) => server.reply(500, 'error'));

      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<Failure, List<Animal>> response =
          await animalRepository.getRandonAnimals(noOfAnimals: 3);

      expect(response.isLeft(), true);
      expect(response.isRight(), false);
    });

    test('returns failure when more than 10 animals are requested', () async {
      final dio = Dio();
      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<Failure, List<Animal>> response =
          await animalRepository.getRandonAnimals(noOfAnimals: 11);

      expect(response.isLeft(), true);
      expect(response.isRight(), false);
    });
  });
}
