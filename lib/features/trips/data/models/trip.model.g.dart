// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TripHiveModelAdapter extends TypeAdapter<TripHiveModel> {
  @override
  final int typeId = 0;

  @override
  TripHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TripHiveModel()
      ..id = fields[0] as String
      ..dateAndTime = fields[1] as DateTime?
      ..kmTrip = fields[2] as double?
      ..kmAbsolute = fields[3] as int?
      ..location = fields[4] as String?;
  }

  @override
  void write(BinaryWriter writer, TripHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateAndTime)
      ..writeByte(2)
      ..write(obj.kmTrip)
      ..writeByte(3)
      ..write(obj.kmAbsolute)
      ..writeByte(4)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TripHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
