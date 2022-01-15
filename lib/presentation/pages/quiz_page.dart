import 'dart:developer';

import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/widgets/animal_detail_widget.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentlySelectedAnimalIndex = -1;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => getIt<QuizPageBloc>()
          ..add(
            const RandomAnimalsRequested(),
          ),
        child: BlocConsumer<QuizPageBloc, QuizPageState>(
          listener: (context, state) {
            if (state is QuizPageAnimalSelected) {
              _showSnackBar(state.result);
            }
          },
          builder: (context, state) => _scaffold(context, state),
        ),
      );

  Widget _scaffold(BuildContext context, QuizPageState state) {
    switch (state.runtimeType) {
      case QuizPageLoaded:
        return _successState(context, (state as QuizPageLoaded).animals);
      case QuizPageError:
        return ErrorScaffold((state as QuizPageError).failure);
      case QuizPageInitial:
      case QuizPageLoading:
      default:
        return const LoadingScaffold();
    }
  }

  Widget _successState(BuildContext context, List<Animal> animals) => Scaffold(
        appBar: AppBar(
          title: const Text('quizAppBarTitle').tr(),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                controller: PageController(
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: animals[index].imageLink.toString(),
                  ),
                ),
                itemCount: animals.length,
                onPageChanged: (currentlySelectedAnimalIndex) => setState(() {
                  log("animal index: $currentlySelectedAnimalIndex");
                  _currentlySelectedAnimalIndex = currentlySelectedAnimalIndex;
                }),
              ),
            ),
            Expanded(
              flex: 5,
              child: AnimalDetail(
                  animal:
                      animals[context.read<QuizPageBloc>().animalToGuessIndex]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {
            context.read<QuizPageBloc>().add(
                  QuizPageEvent.animalSelected(_currentlySelectedAnimalIndex),
                );
          },
          backgroundColor: Colors.green,
        ),
      );

  _showSnackBar(bool result) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: result
              ? Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    const Text('correctAnswer').tr(),
                  ],
                )
              : Row(children: [
                  const Icon(
                    Icons.dangerous,
                    color: Colors.red,
                  ),
                  const Text('wrongAnswer').tr(),
                ]),
        ),
      );
}
