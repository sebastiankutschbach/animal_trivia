import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.freezed.dart';

@freezed
class Animal with _$Animal {
  const Animal._();

  factory Animal(
      {name,
      latinName,
      aninmalType,
      activeTime,
      habitat,
      diet,
      geoRange,
      lengthMin,
      lengthMax,
      weightMin,
      weightMax,
      lifespan,
      id,
      imageLink}) = _Animal;
}
