import 'package:drinkstest/data/remote/models/drink_information_rm.dart';
import 'package:drinkstest/data/remote/models/drink_rm.dart';
import 'package:drinkstest/presentation/model/drink_information.dart';
import 'package:drinkstest/presentation/model/drinks.dart';

extension DrinkRMMapper on DrinkRM {
  Drinks toDomainModel() => Drinks(name: name, image: image, id: id);
}

extension DrinkInformationRMMapper on DrinkInformationRM {
  DrinkInformation toDomainModel() => DrinkInformation(
      name: name,
      image: image,
      id: id,
      instructions: instructions,
      glass: glass,
      mainIngredient: mainIngredient);
}
