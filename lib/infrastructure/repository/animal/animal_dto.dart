import 'package:animal_trivia/domain/animal.dart';
import 'package:animal_trivia/infrastructure/translation/translate_service.dart';
import 'package:animal_trivia/injection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal_dto.g.dart';

@JsonSerializable()
class AnimalDto {
  final String name;
  @JsonKey(name: "latin_name")
  final String latinName;
  @JsonKey(name: "animal_type")
  final String aninmalType;
  @JsonKey(name: "active_time")
  final String activeTime;
  final String habitat;
  final String diet;
  @JsonKey(name: "geo_range")
  final String geoRange;
  @JsonKey(name: "length_min")
  final String lengthMin;
  @JsonKey(name: "length_max")
  final String lengthMax;
  @JsonKey(name: "weight_min")
  final String weightMin;
  @JsonKey(name: "weight_max")
  final String weightMax;
  final String lifespan;
  final int id;
  @JsonKey(name: "image_link")
  final Uri imageLink;

  AnimalDto(
      this.name,
      this.latinName,
      this.aninmalType,
      this.activeTime,
      this.habitat,
      this.diet,
      this.geoRange,
      this.lengthMin,
      this.lengthMax,
      this.weightMin,
      this.weightMax,
      this.lifespan,
      this.id,
      this.imageLink);

  factory AnimalDto.fromJson(Map<String, dynamic> json) =>
      _$AnimalDtoFromJson(json);

  Animal toDomain() => Animal(
      name: name,
      latinName: latinName,
      aninmalType: aninmalType,
      activeTime: activeTime,
      habitat: habitat,
      diet: diet,
      geoRange: geoRange,
      lengthMin: lengthMin,
      lengthMax: lengthMax,
      weightMin: weightMin,
      weightMax: weightMax,
      lifespan: lifespan,
      imageLink: imageLink,
      id: id);

  Future<Animal> toDomainTranslated() async {
    final translateService = getIt<TranslateService>();
    return Animal(
        name: (await translateService.translate(name, from: 'en', to: 'de'))
            .getOrElse(() => name),
        latinName: latinName,
        aninmalType: (await translateService.translate(aninmalType,
                from: 'en', to: 'de'))
            .getOrElse(() => aninmalType),
        activeTime:
            (await translateService.translate(activeTime, from: 'en', to: 'de'))
                .getOrElse(() => activeTime),
        habitat:
            (await translateService.translate(habitat, from: 'en', to: 'de'))
                .getOrElse(() => habitat),
        diet: (await translateService.translate(diet, from: 'en', to: 'de'))
            .getOrElse(() => diet),
        geoRange:
            (await translateService.translate(geoRange, from: 'en', to: 'de'))
                .getOrElse(() => geoRange),
        lengthMin: lengthMin,
        lengthMax: lengthMax,
        weightMin: weightMin,
        weightMax: weightMax,
        lifespan: lifespan,
        imageLink: imageLink,
        id: id);
  }
}
