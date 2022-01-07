import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/infrastructure/repository/animal/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

const String getRandomAnimalPath =
    "https://zoo-animal-api.herokuapp.com/animals/rand";

class AnimalRepository implements IAnimalRepository {
  final Dio client;

  AnimalRepository({required this.client});

  @override
  Future<Either<IFailure, AnimalDto>> getRandonAnimal() async {
    try {
      final response = await client.get(getRandomAnimalPath);
      return right(AnimalDto.fromJson(response.data));
    } catch (e) {
      return left(Failure());
    }
  }
}
