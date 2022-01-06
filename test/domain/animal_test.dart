import 'package:animal_trivia/domain/i_animal.dart';
import 'package:animal_trivia/infrastructure/repository/animal/animal.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('json', () {
    test('parsing', () {
      final animal = Animal.fromJson(sampleAnimalResponse);

      expect(animal.name, "Siamang");
      expect(animal.latinName, "Hylobates syndactylus");
      expect(animal.aninmalType, "Mammal");
      expect(animal.activeTime, "Diurnal");
      expect(animal.lengthMin, "1.90");
      expect(animal.lengthMax, "2.00");
      expect(animal.weightMin, "20");
      expect(animal.weightMax, "23");
      expect(animal.lifespan, "23");
      expect(animal.habitat, "Tropical rainforest");
      expect(animal.diet, "Primarily fruit and leaves, some invertebrates");
      expect(animal.geoRange, "Malaysia and Sumatra");
      expect(animal.imageLink.toString(),
          "https://upload.wikimedia.org/wikipedia/commons/a/a4/DPPP_5348.jpg");
      expect(animal.id, 162);
    });
  });
}

final Map<String, dynamic> sampleAnimalResponse = {
  "name": "Siamang",
  "latin_name": "Hylobates syndactylus",
  "animal_type": "Mammal",
  "active_time": "Diurnal",
  "length_min": "1.90",
  "length_max": "2.00",
  "weight_min": "20",
  "weight_max": "23",
  "lifespan": "23",
  "habitat": "Tropical rainforest",
  "diet": "Primarily fruit and leaves, some invertebrates",
  "geo_range": "Malaysia and Sumatra",
  "image_link":
      "https://upload.wikimedia.org/wikipedia/commons/a/a4/DPPP_5348.jpg",
  "id": 162
};
