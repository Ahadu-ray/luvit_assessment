// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DateCardData _$$_DateCardDataFromJson(Map<String, dynamic> json) =>
    _$_DateCardData(
      age: json['age'] as int,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      likeCount: json['likeCount'] as int,
      location: json['location'] as String,
      name: json['name'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DateCardDataToJson(_$_DateCardData instance) =>
    <String, dynamic>{
      'age': instance.age,
      'description': instance.description,
      'images': instance.images,
      'likeCount': instance.likeCount,
      'location': instance.location,
      'name': instance.name,
      'tags': instance.tags,
    };
