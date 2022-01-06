import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal.dart';
import 'package:dartz/dartz.dart';

abstract class IAnimalRepository {
  Future<Either<IFailure, Animal>> getRandonAnimal();
}
