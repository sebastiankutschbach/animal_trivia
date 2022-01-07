import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:flutter/material.dart';

class AnimalTriviaApp extends StatelessWidget {
  const AnimalTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TriviaPage(),
    );
  }
}
