import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../sample_responses.dart';

main() {
  group('json', () {
    test('parsing', () {
      final animalDto = AnimalDto.fromJson(sampleAnimalResponse1);

      expect(animalDto.name, "Siamang");
      expect(animalDto.latinName, "Hylobates syndactylus");
      expect(animalDto.aninmalType, "Mammal");
      expect(animalDto.activeTime, "Diurnal");
      expect(animalDto.lengthMin, "1.90");
      expect(animalDto.lengthMax, "2.00");
      expect(animalDto.weightMin, "20");
      expect(animalDto.weightMax, "23");
      expect(animalDto.lifespan, "23");
      expect(animalDto.habitat, "Tropical rainforest");
      expect(animalDto.diet, "Primarily fruit and leaves, some invertebrates");
      expect(animalDto.geoRange, "Malaysia and Sumatra");
      expect(animalDto.imageLink.toString(),
          "https://upload.wikimedia.org/wikipedia/commons/a/a4/DPPP_5348.jpg");
      expect(animalDto.id, 162);
    });
  });

  group('to domain object', () {
    test('maps dto to domain object', () {
      final animalDto = AnimalDto.fromJson(sampleAnimalResponse1);
      final Animal animal = animalDto.toDomain();

      expect(animal.name, "Siamang");
      expect(animal.latinName, "Hylobates syndactylus");
      expect(animal.aninmalType, "Mammal");
      expect(animal.activeTime, "Diurnal");
      expect(animal.lengthMin, 1.9 * 30.48);
      expect(animal.lengthMax, 2.0 * 30.48);
      expect(animal.weightMin, 20.0 * 0.45359237);
      expect(animal.weightMax, 23.0 * 0.45359237);
      expect(animal.lifespan, 23.0);
      expect(animal.habitat, "Tropical rainforest");
      expect(animal.diet, "Primarily fruit and leaves, some invertebrates");
      expect(animal.geoRange, "Malaysia and Sumatra");
      expect(animal.imageLink.toString(),
          "https://upload.wikimedia.org/wikipedia/commons/a/a4/DPPP_5348.jpg");
      expect(animal.id, 162);
    });
  });
}
