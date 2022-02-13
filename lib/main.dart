import 'package:drinkstest/common/drink_test_strings.dart';
import 'package:drinkstest/data/cache/models/drink_cm.dart';
import 'package:drinkstest/data/cache/models/drink_information_cm.dart';
import 'package:drinkstest/presentation/screen/drink_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> _hiveInitializer() async {
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter<DrinkCM>(DrinkCMAdapter())
    ..registerAdapter<DrinkInformationCM>(DrinkInformationCMAdapter());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _hiveInitializer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: DrinksTestStrings.appName,
        home: const DrinkScreen(),
      );
}
