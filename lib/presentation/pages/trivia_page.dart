import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/domain/failure.dart';
import 'package:animal_trivia/injection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TriviaPage extends StatelessWidget {
  const TriviaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TriviaPageBloc>(
      create: (context) => getIt<TriviaPageBloc>()
        ..add(
          const TriviaPageEvent.randomAnimalRequested(),
        ),
      child: BlocBuilder<TriviaPageBloc, TriviaPageState>(
        builder: (BuildContext context, TriviaPageState state) => Scaffold(
          appBar: AppBar(
            title: _appBarTitle(context, state),
          ),
          body: _body(context, state),
        ),
      ),
    );
  }

  Widget _appBarTitle(BuildContext context, TriviaPageState state) {
    if (state is AnimalLoadError) {
      return Text(AppLocalizations.of(context)!.error);
    } else if (state is AnimalLoaded) {
      return Text(state.animal.name);
    }
    return Text(AppLocalizations.of(context)!.loading);
  }

  Widget _body(BuildContext context, TriviaPageState state) {
    if (state is AnimalLoadError) {
      return _errorState(context, state.failure);
    } else if (state is AnimalLoaded) {
      return _successState(context, state.animal);
    }
    return _loadingState();
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

  Widget _successState(BuildContext context, Animal animal) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RefreshIndicator(
          onRefresh: () async => context.read<TriviaPageBloc>().add(
                const RandomAnimalRequested(),
              ),
          child: MediaQuery.of(context).orientation == Orientation.portrait
              ? _successStatePortrait(context, animal)
              : _successStateLandscape(context, animal),
        ),
      );

  Widget _successStateLandscape(BuildContext context, Animal animal) =>
      Row(children: [
        Expanded(
          flex: 3,
          child: _animalImage(context, animal),
        ),
        Expanded(
          flex: 5,
          child: _detailsListView(context, animal, withImage: false),
        ),
      ]);

  Widget _successStatePortrait(BuildContext context, Animal animal) =>
      _detailsListView(context, animal, withImage: true);

  Widget _animalImage(BuildContext context, Animal animal) =>
      CachedNetworkImage(
        imageUrl: animal.imageLink.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            downloadProgress.progress == null
                ? Container()
                : LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );

  Widget _detailsListView(BuildContext context, Animal animal,
          {required bool withImage}) =>
      ListView(
        children: [
          withImage ? _animalImage(context, animal) : Container(),
          ListTile(
            leading: const Icon(Icons.title),
            title: Text(AppLocalizations.of(context)!.latinName),
            subtitle: Text(animal.latinName),
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: Text(AppLocalizations.of(context)!.animalType),
            subtitle: Text(animal.aninmalType),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: Text(AppLocalizations.of(context)!.activeTime),
            subtitle: Text(animal.activeTime),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: Text(AppLocalizations.of(context)!.habitat),
            subtitle: Text(animal.habitat),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(AppLocalizations.of(context)!.diet),
            subtitle: Text(animal.diet),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: Text(AppLocalizations.of(context)!.geoRange),
            subtitle: Text(animal.geoRange),
          ),
          ListTile(
            leading: const Icon(Icons.straighten),
            title: Text(AppLocalizations.of(context)!.length),
            subtitle: Text(
                '${animal.lengthMin.toStringAsFixed(2)} - ${animal.lengthMax.toStringAsFixed(2)} cm'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text(AppLocalizations.of(context)!.weight),
            subtitle: Text(
                '${animal.weightMin.toStringAsFixed(2)} - ${animal.weightMax.toStringAsFixed(2)} kg'),
          ),
          ListTile(
            leading: const Icon(Icons.hourglass_bottom),
            title: Text(AppLocalizations.of(context)!.lifespan),
            subtitle: Text(
                '${animal.lifespan} ${AppLocalizations.of(context)!.years}'),
          ),
        ],
      );
}
