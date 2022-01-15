import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/presentation/widgets/animal_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
            title: const Text('latinName').tr(),
            subtitle: Text(animal.latinName),
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('animalType').tr(),
            subtitle: Text(animal.aninmalType),
          ),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('activeTime').tr(),
            subtitle: Text(animal.activeTime),
          ),
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('habitat').tr(),
            subtitle: Text(animal.habitat),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('diet').tr(),
            subtitle: Text(animal.diet),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('geoRange').tr(),
            subtitle: Text(animal.geoRange),
          ),
          ListTile(
            leading: const Icon(Icons.straighten),
            title: const Text('length').tr(),
            subtitle: Text(
                '${animal.lengthMin.toStringAsFixed(2)} - ${animal.lengthMax.toStringAsFixed(2)} cm'),
          ),
          ListTile(
            leading: const Icon(Icons.fitness_center),
            title: const Text('weight').tr(),
            subtitle: Text(
                '${animal.weightMin.toStringAsFixed(2)} - ${animal.weightMax.toStringAsFixed(2)} kg'),
          ),
          ListTile(
            leading: const Icon(Icons.hourglass_bottom),
            title: const Text('lifespan').tr(),
            subtitle: Text('${animal.lifespan} ${'years'.tr()}'),
          ),
        ],
      );
}
