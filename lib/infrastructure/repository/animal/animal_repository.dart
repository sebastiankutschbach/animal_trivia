import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:animal_trivia/domain/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

const String getRandomAnimalPath =
    "https://zoo-animal-api.herokuapp.com/animals/rand";

@Injectable(as: IAnimalRepository)
class AnimalRepository implements IAnimalRepository {
  final Dio client;

  AnimalRepository({required this.client});

  @override
  Future<Either<Failure, Animal>> getRandonAnimal() async {
    try {
      final response = await client.get(getRandomAnimalPath);
      return right(
          await AnimalDto.fromJson(response.data).toDomainTranslated());
    } on DioError catch (e) {
      return left(
        Failure(message: e.message),
      );
    }
  }
}
