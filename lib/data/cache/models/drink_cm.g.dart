// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_cm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkCMAdapter extends TypeAdapter<DrinkCM> {
  @override
  final int typeId = 0;

  @override
  DrinkCM read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrinkCM(
      name: fields[0] as String,
      image: fields[1] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DrinkCM obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkCMAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
