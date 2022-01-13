import 'package:animal_trivia/presentation/pages/home_page.dart';
import 'package:animal_trivia/presentation/pages/quiz_page.dart';
import 'package:animal_trivia/presentation/pages/trivia_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: TriviaPage),
    AutoRoute(page: QuizPage),
  ],
)
class AppRouter extends _$AppRouter {}
