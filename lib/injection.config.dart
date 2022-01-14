// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/quiz_page/quiz_page_bloc.dart' as _i6;
import 'application/trivia_page/trivia_page_bloc.dart' as _i8;
import 'domain/i_animal_repository.dart' as _i4;
import 'infrastructure/core/dio_module.dart' as _i9;
import 'infrastructure/repository/animal/animal_repository.dart' as _i5;
import 'infrastructure/translation/translate_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.Dio>(() => firebaseInjectableModule.dio);
  gh.factory<_i4.IAnimalRepository>(
      () => _i5.AnimalRepository(client: get<_i3.Dio>()));
  gh.factory<_i6.QuizPageBloc>(
      () => _i6.QuizPageBloc(get<_i4.IAnimalRepository>()));
  gh.factory<_i7.TranslateService>(() => _i7.TranslateService(get<_i3.Dio>()));
  gh.factory<_i8.TriviaPageBloc>(() => _i8.TriviaPageBloc(
      get<_i4.IAnimalRepository>(), get<_i7.TranslateService>()));
  return get;
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}
