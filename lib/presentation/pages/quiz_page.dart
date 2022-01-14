import 'package:animal_trivia/application/quiz_page/quiz_page_bloc.dart';
import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/widgets/error_scaffold.dart';
import 'package:animal_trivia/presentation/widgets/loading_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt<QuizPageBloc>()..add(const RandomAnimalsRequested()),
        child: BlocBuilder<QuizPageBloc, QuizPageState>(
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
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: animals[index].imageLink.toString(),
                  ),
                ),
                itemCount: animals.length,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.check),
          onPressed: () {},
          backgroundColor: Colors.green,
        ),
      );
}
