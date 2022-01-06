import 'package:freezed_annotation/freezed_annotation.dart';

part 'animal.g.dart';

@JsonSerializable()
class Animal {
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

  Animal(
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

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
}
