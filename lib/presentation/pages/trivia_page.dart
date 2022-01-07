import 'package:animal_trivia/application/animal/animal_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TriviaPage extends StatelessWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimalBloc>(
      create: (context) => getIt<AnimalBloc>()
        ..add(
          const AnimalEvent.randomAnimalRequested(),
        ),
      child: BlocConsumer<AnimalBloc, AnimalState>(
        listener: (BuildContext context, AnimalState state) {},
        builder: (BuildContext context, AnimalState state) => Scaffold(
          appBar: AppBar(
            title: _appBarTitle(context, state),
          ),
          body: _body(context, state),
        ),
      ),
    );
  }

  Widget _appBarTitle(BuildContext context, AnimalState state) {
    return state.animal.fold(
      () => Text(AppLocalizations.of(context)!.loading),
      (some) => some.fold(
        (failure) => Text(AppLocalizations.of(context)!.error),
        (animal) => Text(animal.name),
      ),
    );
  }

  Widget _body(BuildContext context, AnimalState state) {
    return state.animal.fold(
      () => _loadingState(),
      (some) => some.fold(
        (failure) => _errorState(context, failure),
        (animal) => _successState(context, animal),
      ),
    );
  }

  Widget _loadingState() => const Center(
        child: CircularProgressIndicator(),
      );

  Widget _errorState(BuildContext context, Failure failure) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 40,
            color: Colors.red,
          ),
          Text(AppLocalizations.of(context)!.errorLoadingAnimal +
              '\n' +
              failure.message),
        ],
      ));

  Widget _successState(BuildContext context, Animal animal) => Column(
        children: [
          Image.network(
            animal.imageLink.toString(),
          ),
          Text('Latin name: ${animal.latinName}'),
          Text('Type: ${animal.aninmalType}'),
          Text('Active time: ${animal.activeTime}'),
          Text('Habitat: ${animal.habitat}'),
          Text('Diet: ${animal.diet}'),
          Text('Geo Range: ${animal.geoRange}'),
          Text('Min Length: ${animal.lengthMin} cm'),
          Text('Max Length: ${animal.lengthMax} cm'),
          Text('Min Weight: ${animal.weightMin} kg'),
          Text('Max Weight: ${animal.weightMax} kg'),
          Text('Lifespan: ${animal.lifespan} years'),
        ],
      );
}
