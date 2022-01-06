import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_repository.dart';
import 'package:animal_trivia/infrastructure/repository/animal/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('get randon animal', () {
    test('fetches random animal without error', () async {
      final IAnimalRepository animalRepository = AnimalRepository();
      final Either<IFailure, Animal> response =
          await animalRepository.getRandonAnimal();

      expect(response.isLeft(), false);
      expect(response.isRight(), true);
      expect(response.fold((l) => null, (r) => r), isA<Animal>());
    });
  });
}
