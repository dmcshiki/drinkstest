import 'package:drinkstest/common/drink_test_strings.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: DrinksTestStrings.errorScreenTitle,
                    style: const TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: DrinksTestStrings.errorScreenDescription,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onTryAgain,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                DrinksTestStrings.errorScreenButtonTitle,
                style: const TextStyle(
                  color: Colors.purple,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
}
