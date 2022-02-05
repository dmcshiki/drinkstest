import 'package:json_annotation/json_annotation.dart';

part 'drinks.g.dart';

@JsonSerializable()
class Drinks {
  Drinks({
    required this.name,
    required this.image,
    required this.id,
  });

  @JsonKey(name: "strDrink")
  String name;

  @JsonKey(name: "strDrinkThumb")
  String image;

  @JsonKey(name: "idDrink")
  String id;

  factory Drinks.fromJson(Map<String, dynamic> json) => _$DrinksFromJson(json);
  Map<String, dynamic> toJson() => _$DrinksToJson(this);
}
