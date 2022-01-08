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

  Widget _successState(BuildContext context, Animal animal) => RefreshIndicator(
        onRefresh: () async => context.read<AnimalBloc>().add(
              const RandomAnimalRequested(),
            ),
        child: ListView(
          children: [
            Image.network(
              animal.imageLink.toString(),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.latinName),
              subtitle: Text(animal.latinName),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.animalType),
              subtitle: Text(animal.aninmalType),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.activeTime),
              subtitle: Text(animal.activeTime),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.habitat),
              subtitle: Text(animal.habitat),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.diet),
              subtitle: Text(animal.diet),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.geoRange),
              subtitle: Text(animal.geoRange),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.length),
              subtitle: Text(
                  '${animal.lengthMin.toStringAsFixed(2)} - ${animal.lengthMax.toStringAsFixed(2)} cm'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.weight),
              subtitle: Text(
                  '${animal.weightMin.toStringAsFixed(2)} - ${animal.weightMax.toStringAsFixed(2)} kg'),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.lifespan),
              subtitle: Text(
                  '${animal.lifespan} ${AppLocalizations.of(context)!.years}'),
            ),
          ],
        ),
      );
}
