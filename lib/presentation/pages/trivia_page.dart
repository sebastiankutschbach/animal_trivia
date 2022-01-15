import 'package:animal_trivia/application/trivia_page/trivia_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/widgets/animal_detail_widget.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        builder: (BuildContext context, TriviaPageState state) =>
            _scaffold(context, state),
      ),
    );
  }

  Widget _scaffold(BuildContext context, TriviaPageState state) {
    switch (state.runtimeType) {
      case TriviaPageLoaded:
        return _successState(context, (state as TriviaPageLoaded).animal);
      case TriviaPageError:
        return ErrorScaffold((state as TriviaPageError).failure);
      case TriviaPageInitial:
      case TriviaPageLoading:
      default:
        return const LoadingScaffold();
    }
  }

  Widget _successState(BuildContext context, Animal animal) => Scaffold(
        appBar: AppBar(
          title: Text(animal.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async => context.read<TriviaPageBloc>().add(
                  const RandomAnimalRequested(),
                ),
            child: MediaQuery.of(context).orientation == Orientation.portrait
                ? _successStatePortrait(context, animal)
                : _successStateLandscape(context, animal),
          ),
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
          child: AnimalDetail(animal: animal, withImage: false),
        ),
      ]);

  Widget _successStatePortrait(BuildContext context, Animal animal) =>
      AnimalDetail(animal: animal, withImage: true);

  Widget _animalImage(BuildContext context, Animal animal) =>
      CachedNetworkImage(
        imageUrl: animal.imageLink.toString(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            downloadProgress.progress == null
                ? Container()
                : LinearProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      );
}
