import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/i_animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/i_animal_repository.dart';
import 'package:dartz/dartz.dart';

class AnimalRepository implements IAnimalRepository {
  @override
  Future<Either<Failure, Animal>> getRandonAnimal() {
    // TODO: implement getRandonAnimal
    throw UnimplementedError();
  }
}
