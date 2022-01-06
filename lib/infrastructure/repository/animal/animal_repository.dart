import 'dart:convert';

import 'package:animal_trivia/domain/i_failure.dart';
import 'package:animal_trivia/domain/i_animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/i_animal_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AnimalRepository implements IAnimalRepository {
  @override
  Future<Either<IFailure, Animal>> getRandonAnimal() async {
    final response =
        await Dio().get('https://zoo-animal-api.herokuapp.com/animals/rand');

    if (response.statusCode == 200) {
      return right(Animal.fromJson(response.data));
    } else {
      return left(Failure());
    }
  }
}
