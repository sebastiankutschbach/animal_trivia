import 'dart:developer';

import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';

@freezed
class Animal with _$Animal {
  const Animal._();

  factory Animal(
      {required String name,
      required String latinName,
      required String aninmalType,
      required String activeTime,
      required String habitat,
      required String diet,
      required String geoRange,
      required double lengthMin,
      required double lengthMax,
      required double weightMin,
      required double weightMax,
      required double lifespan,
      required int id,
      required Uri imageLink}) = _Animal;

  static Future<Animal> translateAndConvert(
      Animal animal, TranslateService translateService,
      {required String from, required String to}) async {
    log("From: $from, to: $to");
    final toBeTranslated = [
      animal.name,
      animal.activeTime,
      animal.aninmalType,
      animal.habitat,
      animal.diet,
      animal.geoRange
    ];
    log("Before: $toBeTranslated");
    final List<String> translations = await getTranslationOrFallback(
        translateService, toBeTranslated,
        from: from, to: to);

    log("After: $translations");
    return animal.copyWith(
      name: translations[0],
      activeTime: translations[1],
      aninmalType: translations[2],
      habitat: translations[3],
      diet: translations[4],
      geoRange: translations[5],
    );
  }

  static Future<List<String>> getTranslationOrFallback(
      TranslateService translateService, List<String> texts,
      {required String from, required String to}) async {
    final result = await translateService.translate(texts, from: from, to: to);
    return result.fold((failure) {
      log('Failure during translation: $failure');
      return texts;
    }, (translation) => translation);
  }
}
