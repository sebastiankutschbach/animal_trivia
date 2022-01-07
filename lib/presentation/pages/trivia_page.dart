import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaPage extends StatelessWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimalBloc>(
      create: (context) => AnimalBloc(
        AnimalRepository(
          client: Dio(),
        ),
      )..add(
          const AnimalEvent.randomAnimalRequested(),
        ),
      child: BlocConsumer<AnimalBloc, AnimalState>(
        listener: (BuildContext context, AnimalState state) {},
        builder: (BuildContext context, AnimalState state) => Scaffold(
          appBar: AppBar(),
          body: _body(state),
        ),
      ),
    );
  }

  Widget _body(AnimalState state) {
    return state.animal.fold(
      () => _loadingState(),
      (some) => some.fold(
        (failure) => _errorState(),
        (animal) => Text(
          animal.toString(),
        ),
      ),
    );
  }

  Widget _loadingState() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _errorState() => const Center(
        child: Text('Error'),
      );
}
