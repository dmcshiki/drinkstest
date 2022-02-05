import 'package:dio/dio.dart';
import 'package:drinkstest/model/drink_information.dart';
import 'package:drinkstest/model/drink_information_response.dart';
import 'package:flutter/material.dart';

class DrinkInformationScreen extends StatefulWidget {
  final String drinkID;

  const DrinkInformationScreen({Key? key, required this.drinkID})
      : super(key: key);

  @override
  _DrinkInformationScreenState createState() => _DrinkInformationScreenState();
}

class _DrinkInformationScreenState extends State<DrinkInformationScreen> {
  bool isLoading = false;
  DrinkInformation? drinkInformation;

  Future getDrinkInformation() async {
    Response response;
    try {
      isLoading = true;

      final baseUrl = "https://www.thecocktaildb.com/api/json/v1/1/";

      final dio = Dio();
      dio.interceptors.add(
        LogInterceptor(
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            logPrint: false ? (_) {} : print),
      );

      final response =
          await dio.get('${baseUrl}lookup.php?i=${widget.drinkID}');
      //final response = await dio.get('${baseUrl}lookup.php?i=$drinkid');
      isLoading = false;

      if (response.statusCode == 200) {
        setState(
          () {
            drinkInformation = DrinkInformationResponse.fromJson(response.data)
                .drinkInformation
                .first;
          },
        );
      } else {
        print("There is some problem");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    getDrinkInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strongDrinkInformation = drinkInformation;
    if (strongDrinkInformation != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Informacoes da bebida"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.network(
                        strongDrinkInformation.image,
                        height: 256,
                        width: 256,
                      ),
                      Flexible(
                        child: Text("ID: ${strongDrinkInformation.id}"),
                      ),
                      Flexible(
                        child: Text("Bebida: ${strongDrinkInformation.name}"),
                      ),
                      Flexible(
                        child: Text(
                            "Modo de preparo: ${strongDrinkInformation.instructions}"),
                      ),
                      Flexible(
                        child: Text("Copo: ${strongDrinkInformation.glass}"),
                      ),
                      Flexible(
                        child: Text(
                            "Ingrediente principal: ${strongDrinkInformation.mainIngredient}"),
                      ),
                    ],
                  ),
                ),
              ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
