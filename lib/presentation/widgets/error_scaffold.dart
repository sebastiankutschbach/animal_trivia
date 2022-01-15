import 'package:animal_trivia/domain/failure.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
              Text('errorLoadingAnimal'
                  .tr(namedArgs: {'errorMessage': failure.message})),
            ],
          ),
        ),
      );
}
