import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/presentation/widgets/animal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimalDetail extends StatelessWidget {
  final Animal animal;
  final bool withImage;

  const AnimalDetail({required this.animal, this.withImage = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          withImage ? AnimalImage(animal: animal) : Container(),
          ListTile(
            leading: const Icon(Icons.title),
            title: Text(AppLocalizations.of(context)!.latinName),
            subtitle: Text(animal.latinName),
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: Text(AppLocalizations.of(context)!.animalType),
            subtitle: Text(animal.aninmalType),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: Text(AppLocalizations.of(context)!.activeTime),
            subtitle: Text(animal.activeTime),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: Text(AppLocalizations.of(context)!.habitat),
            subtitle: Text(animal.habitat),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: Text(AppLocalizations.of(context)!.diet),
            subtitle: Text(animal.diet),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: Text(AppLocalizations.of(context)!.geoRange),
            subtitle: Text(animal.geoRange),
          ),
          ListTile(
            leading: const Icon(Icons.straighten),
            title: Text(AppLocalizations.of(context)!.length),
            subtitle: Text(
                '${animal.lengthMin.toStringAsFixed(2)} - ${animal.lengthMax.toStringAsFixed(2)} cm'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: Text(AppLocalizations.of(context)!.weight),
            subtitle: Text(
                '${animal.weightMin.toStringAsFixed(2)} - ${animal.weightMax.toStringAsFixed(2)} kg'),
          ),
          ListTile(
            leading: const Icon(Icons.hourglass_bottom),
            title: Text(AppLocalizations.of(context)!.lifespan),
            subtitle: Text(
                '${animal.lifespan} ${AppLocalizations.of(context)!.years}'),
          ),
        ],
      );
}
