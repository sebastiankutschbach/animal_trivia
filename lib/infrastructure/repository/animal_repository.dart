import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/infrastructure/repository/i_animal_repository.dart';
import 'package:dartz/dartz.dart';

class AnimalRepository implements IAnimalRepository {
  @override
  Future<Either<Failure, Animal>> getRandonAnimal() {
    // TODO: implement getRandonAnimal
    throw UnimplementedError();
  }
}
