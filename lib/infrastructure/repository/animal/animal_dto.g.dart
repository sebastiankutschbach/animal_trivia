// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalDto _$AnimalDtoFromJson(Map<String, dynamic> json) => AnimalDto(
      json['name'] as String,
      json['latin_name'] as String,
      json['animal_type'] as String,
      json['active_time'] as String,
      json['habitat'] as String,
      json['diet'] as String,
      json['geo_range'] as String,
      json['length_min'] as String,
      json['length_max'] as String,
      json['weight_min'] as String,
      json['weight_max'] as String,
      json['lifespan'] as String,
      json['id'] as int,
      Uri.parse(json['image_link'] as String),
    );

Map<String, dynamic> _$AnimalDtoToJson(AnimalDto instance) => <String, dynamic>{
      'name': instance.name,
      'latin_name': instance.latinName,
      'animal_type': instance.aninmalType,
      'active_time': instance.activeTime,
      'habitat': instance.habitat,
      'diet': instance.diet,
      'geo_range': instance.geoRange,
      'length_min': instance.lengthMin,
      'length_max': instance.lengthMax,
      'weight_min': instance.weightMin,
      'weight_max': instance.weightMax,
      'lifespan': instance.lifespan,
      'id': instance.id,
      'image_link': instance.imageLink.toString(),
    };
