// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Spirit _$SpiritFromJson(Map<String, dynamic> json) => Spirit(
      name: json['name'] as String? ?? '',
      core_type: json['core_type'] as String? ?? '',
      description: json['description'] as String? ?? '',
      index_id: json['id'] as String? ?? '',
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$SpiritToJson(Spirit instance) => <String, dynamic>{
      'id': instance.index_id,
      'name': instance.name,
      'description': instance.description,
      'core_type': instance.core_type,
      'image': instance.image,
    };
