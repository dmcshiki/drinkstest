import 'package:hive/hive.dart';

part 'drink_information_cm.g.dart';

@HiveType(typeId: 1)
class DrinkInformationCM {
  DrinkInformationCM({
    required this.name,
    required this.image,
    required this.id,
    required this.instructions,
    required this.glass,
    required this.mainIngredient,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String id;

  @HiveField(3)
  String instructions;

  @HiveField(4)
  String glass;

  @HiveField(5)
  String mainIngredient;
}
