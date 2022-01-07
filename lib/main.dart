import 'package:animal_trivia/injection.dart';
import 'package:animal_trivia/presentation/animal_trivia_app.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const AnimalTriviaApp());
}
