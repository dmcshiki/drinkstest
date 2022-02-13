import 'package:drinkstest/data/cache/drink_cds.dart';
import 'package:drinkstest/data/mapper/cache_to_domain.dart';
import 'package:drinkstest/data/mapper/remote_to_cache.dart';
import 'package:drinkstest/data/mapper/remote_to_domain.dart';
import 'package:drinkstest/data/remote/drink_rds.dart';
import 'package:drinkstest/presentation/model/drink_information.dart';
import 'package:drinkstest/presentation/model/drinks.dart';

class DrinkRepository {
  DrinkRepository();

  final DrinkRDS rds = DrinkRDS();
  final DrinkCDS cds = DrinkCDS();

  Future<List<Drinks>> getDrinks() => rds.getDrinks().then((drinks) {
        cds.upsertDrinksToCache(
          drinks.map((drink) => drink.toCacheModel()).toList(),
        );
        return drinks.map((drink) => drink.toDomainModel()).toList();
      }).catchError(
        (_) => cds.getDrinksFromCache().then(
              (drinks) => drinks
                  .map(
                    (drink) => drink.toDomainModel(),
                  )
                  .toList(),
            ),
      );

  Future<DrinkInformation> getDrinkInformation(String drinkID) =>
      rds.getDrinkInformation(drinkID).then((drink) {
        cds.upsertDrinkToCache(
          drink.toCacheModel(),
        );
        return drink.toDomainModel();
      }).catchError(
        (_) => cds.getDrinkFromCache(drinkID).then(
              (drink) => drink.toDomainModel(),
            ),
      );
}
