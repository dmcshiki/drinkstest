import 'package:dio/dio.dart';
import 'package:drinkstest/data/remote/models/drink_information_rm.dart';
import 'package:drinkstest/data/remote/models/drink_rm.dart';

class DrinkRDS {
  final _baseURL = 'https://www.thecocktaildb.com/api/json/v1/1/';
  final dio = Dio()
    ..interceptors.add(
      LogInterceptor(
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          // ignore: dead_code
          logPrint: false ? (_) {} : print),
    );

  Future<List<DrinkRM>> getDrinks() =>
      dio.get('${_baseURL}filter.php?a=Alcoholic').then(
            (response) => DrinkResponseRM.fromJson(response.data).drinks,
          );

  Future<DrinkInformationRM> getDrinkInformation(String drinkID) =>
      dio.get('${_baseURL}lookup.php?i=$drinkID').then(
            (response) => DrinkInformationResponseRM.fromJson(response.data)
                .drinkInformation
                .first,
          );
}
