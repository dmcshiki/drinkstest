// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drinks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drinks _$DrinksFromJson(Map<String, dynamic> json) => Drinks(
      name: json['strDrink'] as String,
      image: json['strDrinkThumb'] as String,
      id: json['idDrink'] as String,
    );

Map<String, dynamic> _$DrinksToJson(Drinks instance) => <String, dynamic>{
      'strDrink': instance.name,
      'strDrinkThumb': instance.image,
      'idDrink': instance.id,
    };
