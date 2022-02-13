// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_information_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkInformationCMAdapter extends TypeAdapter<DrinkInformationCM> {
  @override
  final int typeId = 1;

  @override
  DrinkInformationCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrinkInformationCM(
      name: fields[0] as String,
      image: fields[1] as String,
      id: fields[2] as String,
      instructions: fields[3] as String,
      glass: fields[4] as String,
      mainIngredient: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DrinkInformationCM obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.instructions)
      ..writeByte(4)
      ..write(obj.glass)
      ..writeByte(5)
      ..write(obj.mainIngredient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkInformationCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
