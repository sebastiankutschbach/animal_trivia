// Mocks generated by Mockito 5.0.17 from annotations
// in animal_trivia/test/presentation/pages/trivia_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:animal_trivia/domain/animal.dart' as _i7;
import 'package:animal_trivia/domain/failure.dart' as _i6;
import 'package:animal_trivia/domain/i_animal_repository.dart' as _i4;
import 'package:animal_trivia/infrastructure/translation/translate_service.dart'
    as _i8;
import 'package:dartz/dartz.dart' as _i2;
import 'package:dio/dio.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeDio_1 extends _i1.Fake implements _i3.Dio {}

/// A class which mocks [IAnimalRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockIAnimalRepository extends _i1.Mock implements _i4.IAnimalRepository {
  MockIAnimalRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.Animal>> getRandonAnimal() =>
      (super.noSuchMethod(Invocation.method(#getRandonAnimal, []),
              returnValue: Future<_i2.Either<_i6.Failure, _i7.Animal>>.value(
                  _FakeEither_0<_i6.Failure, _i7.Animal>()))
          as _i5.Future<_i2.Either<_i6.Failure, _i7.Animal>>);
}

/// A class which mocks [TranslateService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTranslateService extends _i1.Mock implements _i8.TranslateService {
  MockTranslateService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Dio get client =>
      (super.noSuchMethod(Invocation.getter(#client), returnValue: _FakeDio_1())
          as _i3.Dio);
  @override
  _i5.Future<_i2.Either<_i6.Failure, String>> translate(String? s,
          {String? from, String? to}) =>
      (super.noSuchMethod(
              Invocation.method(#translate, [s], {#from: from, #to: to}),
              returnValue: Future<_i2.Either<_i6.Failure, String>>.value(
                  _FakeEither_0<_i6.Failure, String>()))
          as _i5.Future<_i2.Either<_i6.Failure, String>>);
}