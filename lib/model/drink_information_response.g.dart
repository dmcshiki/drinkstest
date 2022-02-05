// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_information_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkInformationResponse _$DrinkInformationResponseFromJson(
        Map<String, dynamic> json) =>
    DrinkInformationResponse(
      drinkInformation: (json['drinks'] as List<dynamic>)
          .map((e) => DrinkInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkInformationResponseToJson(
        DrinkInformationResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinkInformation,
    };
