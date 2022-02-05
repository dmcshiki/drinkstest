import 'package:json_annotation/json_annotation.dart';

part 'drink_information.g.dart';

@JsonSerializable()
class DrinkInformation {
  DrinkInformation({
    required this.name,
    required this.image,
    required this.id,
    required this.instructions,
    required this.glass,
    required this.mainIngredient,
  });

  @JsonKey(name: "strDrink")
  String name;

  @JsonKey(name: "strDrinkThumb")
  String image;

  @JsonKey(name: "idDrink")
  String id;

  @JsonKey(name: "strInstructions")
  String instructions;

  @JsonKey(name: "strGlass")
  String glass;

  @JsonKey(name: "strIngredient1")
  String mainIngredient;

  factory DrinkInformation.fromJson(Map<String, dynamic> json) =>
      _$DrinkInformationFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkInformationToJson(this);
}
