import 'package:dio/dio.dart';
import 'package:drinkstest/model/drinks.dart';
import 'package:drinkstest/model/drink_response.dart';
import 'package:flutter/material.dart';

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({Key? key}) : super(key: key);

  @override
  _DrinkScreenState createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  bool isLoading = false;
  List<Drinks>? drinks;
  Future getDrink() async {
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

      final response = await dio.get('${baseUrl}filter.php?a=Alcoholic');
      //final response = await dio.get('${baseUrl}lookup.php?i=$drinkid');
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          drinks = DrinkResponse.fromJson(response.data).drinks;
        });
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
    getDrink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final strongDrinks = drinks;
    if (strongDrinks != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Get Drinks"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                itemCount: strongDrinks.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () => print(strongDrinks[index].id),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.network(
                          strongDrinks[index].image,
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          child: Text(
                              "Bebida: ${strongDrinks[index].name} com codigo ${strongDrinks[index].id}"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      );
    } else {
      return const Center(
        child: Text("There's no drink"),
      );
    }
  }
}
