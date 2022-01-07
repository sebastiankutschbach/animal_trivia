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
      required String lengthMin,
      required String lengthMax,
      required String weightMin,
      required String weightMax,
      required String lifespan,
      required int id,
      required Uri imageLink}) = _Animal;
}
