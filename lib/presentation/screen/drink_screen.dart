import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkstest/common/drink_test_strings.dart';
import 'package:drinkstest/data/repository/drink_repository.dart';
import 'package:drinkstest/presentation/common/error_view.dart';
import 'package:drinkstest/presentation/common/loading_view.dart';
import 'package:drinkstest/presentation/model/drinks.dart';
import 'package:drinkstest/presentation/screen/drink_information_screen.dart';
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

  void getDrinks() {
    setState(() {
      state = ScreenStates.loading;
    });

    final repository = DrinkRepository();

    repository.getDrinks().then(
      (drinks) {
        setState(
          () {
            this.drinks = drinks;
            state = ScreenStates.success;
          },
        );
      },
    ).catchError(
      (_) {
        setState(
          () {
            state = ScreenStates.error;
          },
        );
      },
    );
  }

  @override
  void initState() {
    getDrinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(DrinksTestStrings.drinkScreenTitle),
        backgroundColor: Colors.brown[400],
      ),
      body: state == ScreenStates.loading
          ? const LoadingView()
          : state == ScreenStates.success
              ? GridView.builder(
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
                  itemCount: drinks.length,
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
              : ErrorView(onTryAgain: getDrinks));
}
