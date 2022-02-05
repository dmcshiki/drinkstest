// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkInformation _$DrinkInformationFromJson(Map<String, dynamic> json) =>
    DrinkInformation(
      name: json['strDrink'] as String,
      image: json['strDrinkThumb'] as String,
      id: json['idDrink'] as String,
      instructions: json['strInstructions'] as String,
      glass: json['strGlass'] as String,
      mainIngredient: json['strIngredient1'] as String,
    );

Map<String, dynamic> _$DrinkInformationToJson(DrinkInformation instance) =>
    <String, dynamic>{
      'strDrink': instance.name,
      'strDrinkThumb': instance.image,
      'idDrink': instance.id,
      'strInstructions': instance.instructions,
      'strGlass': instance.glass,
      'strIngredient1': instance.mainIngredient,
    };
