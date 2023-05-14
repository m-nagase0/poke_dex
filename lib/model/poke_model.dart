import 'package:json_annotation/json_annotation.dart';

part 'poke_model.g.dart';


@JsonSerializable()
class Pokemon {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final List<Type>? types;
  final List<Map<String, dynamic>>? abilities;
  @JsonKey(name: "sprites") final ImageUrl? imageUrl;

  Pokemon({this.id, this.name, this.height, this.weight, this.types, this.imageUrl, this.abilities});

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}

@JsonSerializable()
class Type {
  final String? name;
  Type({this.name});

  factory Type.fromJson(Map<String, dynamic> json) {
    final type = json['type'] as Map<String, dynamic>;
    return Type(
      name: type['name'] as String?,
    );
  }
  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class ImageUrl {
  final String? front_default;
  final String? back_default;
  final String? front_shiny;
  final String? back_shiny;
  ImageUrl({this.front_default, this.back_default, this.front_shiny, this.back_shiny});

  factory ImageUrl.fromJson(Map<String, dynamic> json) => _$ImageUrlFromJson(json);
  Map<String, dynamic> toJson() => _$ImageUrlToJson(this);
}