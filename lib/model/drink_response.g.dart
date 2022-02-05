// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkResponse _$DrinkResponseFromJson(Map<String, dynamic> json) =>
    DrinkResponse(
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => Drinks.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkResponseToJson(DrinkResponse instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };
