import 'package:json_annotation/json_annotation.dart';

part 'drink_rm.g.dart';

@JsonSerializable()
class DrinkResponseRM {
  DrinkResponseRM({
    required this.drinks,
  });

  factory DrinkResponseRM.fromJson(Map<String, dynamic> json) =>
      _$DrinkResponseRMFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkResponseRMToJson(this);

  @JsonKey(name: 'drinks')
  List<DrinkRM> drinks;
}

@JsonSerializable()
class DrinkRM {
  DrinkRM({
    required this.name,
    required this.image,
    required this.id,
  });

  factory DrinkRM.fromJson(Map<String, dynamic> json) =>
      _$DrinkRMFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkRMToJson(this);

  @JsonKey(name: 'strDrink')
  String name;

  @JsonKey(name: 'strDrinkThumb')
  String image;

  @JsonKey(name: 'idDrink')
  String id;
}
