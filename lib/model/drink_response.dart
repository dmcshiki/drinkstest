import 'package:drinkstest/model/drinks.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink_response.g.dart';

@JsonSerializable()
class DrinkResponse {
  DrinkResponse({
    required this.drinks,
  });

  @JsonKey(name: "drinks")
  List<Drinks> drinks;

  factory DrinkResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkResponseToJson(this);
}
