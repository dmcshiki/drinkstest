// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkResponseRM _$DrinkResponseRMFromJson(Map<String, dynamic> json) =>
    DrinkResponseRM(
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => DrinkRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkResponseRMToJson(DrinkResponseRM instance) =>
    <String, dynamic>{
      'drinks': instance.drinks,
    };

DrinkRM _$DrinkRMFromJson(Map<String, dynamic> json) => DrinkRM(
      name: json['strDrink'] as String,
      image: json['strDrinkThumb'] as String,
      id: json['idDrink'] as String,
    );

Map<String, dynamic> _$DrinkRMToJson(DrinkRM instance) => <String, dynamic>{
      'strDrink': instance.name,
      'strDrinkThumb': instance.image,
      'idDrink': instance.id,
    };
