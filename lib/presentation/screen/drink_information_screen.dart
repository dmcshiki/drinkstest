import 'package:cached_network_image/cached_network_image.dart';
import 'package:drinkstest/common/drink_test_strings.dart';
import 'package:drinkstest/data/repository/drink_repository.dart';
import 'package:drinkstest/presentation/common/error_view.dart';
import 'package:drinkstest/presentation/common/loading_view.dart';
import 'package:drinkstest/presentation/model/drink_information.dart';
import 'package:flutter/material.dart';

enum ScreenStates { loading, success, error }

class DrinkInformationScreen extends StatefulWidget {
  const DrinkInformationScreen({required this.drinkID, Key? key})
      : super(key: key);

  final String drinkID;

  @override
  _DrinkInformationScreenState createState() => _DrinkInformationScreenState();
}

class _DrinkInformationScreenState extends State<DrinkInformationScreen> {
  ScreenStates state = ScreenStates.loading;
  late DrinkInformation drinkInformation;

  void getDrinkInformation() {
    final repository = DrinkRepository();
    setState(() {
      state = ScreenStates.loading;
    });

    repository.getDrinkInformation(widget.drinkID).then(
      (drink) {
        setState(() {
          drinkInformation = drink;
          state = ScreenStates.success;
        });
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
    getDrinkInformation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(DrinksTestStrings.drinkInformationScreenTitle),
        backgroundColor: Colors.brown[400],
      ),
      body: state == ScreenStates.loading
          ? const LoadingView()
          : state == ScreenStates.success
              ? DrinkInformationView(drinkInformation: drinkInformation)
              : ErrorView(onTryAgain: getDrinkInformation));
}

class DrinkInformationView extends StatelessWidget {
  const DrinkInformationView({
    required this.drinkInformation,
    Key? key,
  }) : super(key: key);

  final DrinkInformation drinkInformation;

  @override
  Widget build(BuildContext context) {
    final drinkFields = [
      [
        drinkInformation.name,
        DrinksTestStrings.drinkInformationScreenNameLabel
      ],
      [
        drinkInformation.glass,
        DrinksTestStrings.drinkInformationScreenGlassLabel
      ],
      [
        drinkInformation.mainIngredient,
        DrinksTestStrings.drinkInformationScreenMainIngredientLabel
      ],
      [
        drinkInformation.instructions,
        DrinksTestStrings.drinkInformationScreenInstructionsLabel
      ],
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(96),
                child: CachedNetworkImage(
                  imageUrl: drinkInformation.image,
                  width: 192,
                  height: 192,
                ),
              ),
            ),
            ...drinkFields.map(
              (drinkInfo) => Padding(
                padding: const EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: drinkInfo[1],
                      style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: drinkInfo[0],
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
