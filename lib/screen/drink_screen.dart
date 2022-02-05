import 'package:dio/dio.dart';
import 'package:drinkstest/model/drinks.dart';
import 'package:drinkstest/model/drink_response.dart';
import 'package:drinkstest/screen/drink_information_screen.dart';
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
          title: const Text("Bebidas"),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 24,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: strongDrinks.length,
                itemBuilder: (context, index) => ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(8),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrinkInformationScreen(
                        drinkID: strongDrinks[index].id,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Image.network(
                              strongDrinks[index].image,
                              height: 96,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            height: 96,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.center,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.white70],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          strongDrinks[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            overflow: TextOverflow.clip,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
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
