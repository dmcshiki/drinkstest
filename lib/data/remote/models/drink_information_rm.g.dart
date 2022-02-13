// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_information_rm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrinkInformationResponseRM _$DrinkInformationResponseRMFromJson(
        Map<String, dynamic> json) =>
    DrinkInformationResponseRM(
      drinkInformation: (json['drinks'] as List<dynamic>)
          .map((e) => DrinkInformationRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DrinkInformationResponseRMToJson(
        DrinkInformationResponseRM instance) =>
    <String, dynamic>{
      'drinks': instance.drinkInformation,
    };

DrinkInformationRM _$DrinkInformationRMFromJson(Map<String, dynamic> json) =>
    DrinkInformationRM(
      name: json['strDrink'] as String,
      image: json['strDrinkThumb'] as String,
      id: json['idDrink'] as String,
      instructions: json['strInstructions'] as String,
      glass: json['strGlass'] as String,
      mainIngredient: json['strIngredient1'] as String,
    );

Map<String, dynamic> _$DrinkInformationRMToJson(DrinkInformationRM instance) =>
    <String, dynamic>{
      'strDrink': instance.name,
      'strDrinkThumb': instance.image,
      'idDrink': instance.id,
      'strInstructions': instance.instructions,
      'strGlass': instance.glass,
      'strIngredient1': instance.mainIngredient,
    };
