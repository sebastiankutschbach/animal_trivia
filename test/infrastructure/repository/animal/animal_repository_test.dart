import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_repository.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'animal_dto_test.dart';

main() {
  group('get randon animal', () {
    test('fetches random animal without error', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet(getRandomAnimalPath,
          (server) => server.reply(200, sampleAnimalResponse));

      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<IFailure, Animal> response =
          await animalRepository.getRandonAnimal();

      expect(response.isLeft(), false);
      expect(response.isRight(), true);
      expect(response.fold((l) => null, (r) => r), isA<Animal>());
    });

    test('returns failure when api does not return 200', () async {
      final dio = Dio();
      final dioAdapter = DioAdapter(dio: dio);
      dio.httpClientAdapter = dioAdapter;

      dioAdapter.onGet(
          getRandomAnimalPath, (server) => server.reply(500, 'error'));

      final IAnimalRepository animalRepository = AnimalRepository(client: dio);
      final Either<IFailure, Animal> response =
          await animalRepository.getRandonAnimal();

      expect(response.isLeft(), true);
      expect(response.isRight(), false);
    });
  });
}
