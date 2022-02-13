import 'package:drinkstest/common/drink_test_strings.dart';
import 'package:drinkstest/data/cache/models/drink_cm.dart';
import 'package:drinkstest/data/cache/models/drink_information_cm.dart';
import 'package:hive/hive.dart';

class DrinkCDS {
  static const _drinkInformationBoxKey = 'drinkInformation';
  static const _drinksBoxKey = 'drinks';

  Future<List<DrinkCM>> getDrinksFromCache() async {
    final box = await Hive.openBox<List>(_drinksBoxKey);
    final drinks = box.getAt(0);
    if (drinks != null) {
      return List<DrinkCM>.from(drinks);
    }
    throw Exception(DrinksTestStrings.drinkCacheException);
  }

  Future<void> upsertDrinksToCache(List<DrinkCM> drinks) async {
    final box = await Hive.openBox<List>(_drinksBoxKey);

    return box.putAll({0: drinks});
  }

  Future<DrinkInformationCM> getDrinkFromCache(String drinkId) async {
    final box = await Hive.openBox<DrinkInformationCM>(_drinkInformationBoxKey);
    final drink = box.get(drinkId);
    if (drink != null) {
      return drink;
    }
    throw Exception(DrinksTestStrings.drinkCacheException);
  }

  Future<void> upsertDrinkToCache(DrinkInformationCM drink) async {
    final box = await Hive.openBox<DrinkInformationCM>(_drinkInformationBoxKey);

    return box.put(drink.id, drink);
  }
}
