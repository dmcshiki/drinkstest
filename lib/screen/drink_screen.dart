import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:drinkstest/model/drinks.dart';
import 'package:drinkstest/model/drink_response.dart';
import 'package:drinkstest/screen/drink_information_screen.dart';
import 'package:flutter/material.dart';

enum ScreenStates { loading, success, error }

class DrinkScreen extends StatefulWidget {
  const DrinkScreen({Key? key}) : super(key: key);
  @override
  _DrinkScreenState createState() => _DrinkScreenState();
}

class _DrinkScreenState extends State<DrinkScreen> {
  ScreenStates state = ScreenStates.loading;
  late List<Drinks> drinks;
  Future getDrink() async {
    Response response;
    try {
      state = ScreenStates.loading;
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

      if (response.statusCode == 200) {
        setState(() {
          drinks = DrinkResponse.fromJson(response.data).drinks;
          state = ScreenStates.success;
        });
      } else {
        setState(() {
          state = ScreenStates.error;
        });
      }
    } on Exception catch (e) {
      setState(() {
        state = ScreenStates.error;
      });
    }
  }

  @override
  void initState() {
    getDrink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bebidas"),
          backgroundColor: Colors.purple,
        ),
        body: state == ScreenStates.loading
            ? const Center(child: CircularProgressIndicator())
            : state == ScreenStates.success
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 24,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: drinks.length,
                    itemBuilder: (context, index) => ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        elevation: MaterialStateProperty.all(8),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DrinkInformationScreen(
                            drinkID: drinks[index].id,
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
                                child: CachedNetworkImage(
                                  imageUrl: drinks[index].image,
                                  height: 96,
                                  fit: BoxFit.fill,
                                  placeholder: (context, _) => Transform.scale(
                                    scale: 0.5,
                                    child: const CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 96,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.white70
                                    ],
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
                              drinks[index].name,
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
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Ops!',
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Não foi possível realizar conexão com o servidor',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => getDrink(),
                        behavior: HitTestBehavior.opaque,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Tentar novamente',
                            style: TextStyle(
                              color: Colors.purple,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
