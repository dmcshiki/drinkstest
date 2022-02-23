import 'package:drinkstest/data/cache/models/drink_cm.dart';
import 'package:drinkstest/data/cache/models/drink_information_cm.dart';
import 'package:drinkstest/presentation/model/drink_information.dart';
import 'package:drinkstest/presentation/model/drinks.dart';

extension DrinkCMMapper on DrinkCM {
  Drinks toDomainModel() => Drinks(
        name: name,
        image: image,
        id: id,
      );
}

extension DrinkInformationCMMapper on DrinkInformationCM {
  DrinkInformation toDomainModel() => DrinkInformation(
      name: name,
      image: image,
      id: id,
      instructions: instructions,
      glass: glass,
      mainIngredient: mainIngredient);
}
