import 'package:animal_trivia/domain/failure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScaffold extends StatelessWidget {
  final Failure failure;

  const ErrorScaffold(this.failure, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Loading'),
        ),
        body: Center(
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
          ),
        ),
      );
}
