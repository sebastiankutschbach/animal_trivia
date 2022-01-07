import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/i_failure.dart';
import 'package:dartz/dartz.dart';

abstract class IAnimalRepository {
  Future<Either<IFailure, Animal>> getRandonAnimal();
}
