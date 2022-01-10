import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:dartz/dartz.dart';

abstract class IAnimalRepository {
  Future<Either<Failure, List<Animal>>> getRandonAnimals({int noOfAnimals});
}
