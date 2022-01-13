import 'package:animal_trivia/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeScreenEntry(
              label: const Text("QUIZ"),
              iconData: Icons.quiz,
              onPressed: () => AutoRouter.of(context).push(
                const QuizRoute(),
              ),
            ),
            _homeScreenEntry(
              label: const Text("TRIVIA"),
              iconData: Icons.fact_check,
              onPressed: () => AutoRouter.of(context).push(
                const TriviaRoute(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeScreenEntry(
          {required Widget label,
          required IconData iconData,
          required onPressed}) =>
      FractionallySizedBox(
        widthFactor: 0.5,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(iconData),
          label: label,
        ),
      );
}
