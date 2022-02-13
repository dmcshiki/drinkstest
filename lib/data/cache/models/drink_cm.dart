import 'package:hive/hive.dart';

part 'drink_cm.g.dart';

@HiveType(typeId: 0)
class DrinkCM {
  DrinkCM({
    required this.name,
    required this.image,
    required this.id,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  String image;

  @HiveField(2)
  String id;
}
