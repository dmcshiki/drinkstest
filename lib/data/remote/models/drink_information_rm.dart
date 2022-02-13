import 'package:json_annotation/json_annotation.dart';

part 'drink_information_rm.g.dart';

@JsonSerializable()
class DrinkInformationResponseRM {
  DrinkInformationResponseRM({
    required this.drinkInformation,
  });

  factory DrinkInformationResponseRM.fromJson(Map<String, dynamic> json) =>
      _$DrinkInformationResponseRMFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkInformationResponseRMToJson(this);

  @JsonKey(name: 'drinks')
  List<DrinkInformationRM> drinkInformation;
}

@JsonSerializable()
class DrinkInformationRM {
  DrinkInformationRM({
    required this.name,
    required this.image,
    required this.id,
    required this.instructions,
    required this.glass,
    required this.mainIngredient,
  });

  factory DrinkInformationRM.fromJson(Map<String, dynamic> json) =>
      _$DrinkInformationRMFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkInformationRMToJson(this);

  @JsonKey(name: 'strDrink')
  String name;

  @JsonKey(name: 'strDrinkThumb')
  String image;

  @JsonKey(name: 'idDrink')
  String id;

  @JsonKey(name: 'strInstructions')
  String instructions;

  @JsonKey(name: 'strGlass')
  String glass;

  @JsonKey(name: 'strIngredient1')
  String mainIngredient;
}
