// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      id: json['id'] as int?,
      name: json['name'] as String?,
      height: json['height'] as int?,
      weight: json['weight'] as int?,
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageUrl: json['sprites'] == null
          ? null
          : ImageUrl.fromJson(json['sprites'] as Map<String, dynamic>),
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'types': instance.types,
      'abilities': instance.abilities,
      'sprites': instance.imageUrl,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
    };

ImageUrl _$ImageUrlFromJson(Map<String, dynamic> json) => ImageUrl(
      front_default: json['front_default'] as String?,
      back_default: json['back_default'] as String?,
      front_shiny: json['front_shiny'] as String?,
      back_shiny: json['back_shiny'] as String?,
    );

Map<String, dynamic> _$ImageUrlToJson(ImageUrl instance) => <String, dynamic>{
      'front_default': instance.front_default,
      'back_default': instance.back_default,
      'front_shiny': instance.front_shiny,
      'back_shiny': instance.back_shiny,
    };
