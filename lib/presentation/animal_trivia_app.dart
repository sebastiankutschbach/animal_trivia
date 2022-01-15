import 'package:animal_trivia/app_router.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AnimalTriviaApp extends StatelessWidget {
  final _appRouter = AppRouter();

  AnimalTriviaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'appTitle'.tr(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
