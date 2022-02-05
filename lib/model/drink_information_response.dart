import 'package:drinkstest/model/drink_information.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink_information_response.g.dart';

@JsonSerializable()
class DrinkInformationResponse {
  DrinkInformationResponse({
    required this.drinkInformation,
  });

  @JsonKey(name: "drinks")
  List<DrinkInformation> drinkInformation;

  factory DrinkInformationResponse.fromJson(Map<String, dynamic> json) =>
      _$DrinkInformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkInformationResponseToJson(this);
}
