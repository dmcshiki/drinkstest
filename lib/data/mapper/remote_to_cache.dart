import 'package:drinkstest/data/cache/models/drink_cm.dart';
import 'package:drinkstest/data/cache/models/drink_information_cm.dart';
import 'package:drinkstest/data/remote/models/drink_information_rm.dart';
import 'package:drinkstest/data/remote/models/drink_rm.dart';

extension DrinkRMMapper on DrinkRM {
  DrinkCM toCacheModel() => DrinkCM(
        name: name,
        image: image,
        id: id,
      );
}

extension DrinkInformationRMMapper on DrinkInformationRM {
  DrinkInformationCM toCacheModel() => DrinkInformationCM(
      name: name,
      image: image,
      id: id,
      instructions: instructions,
      glass: glass,
      mainIngredient: mainIngredient);
}
