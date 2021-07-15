import 'package:fahrtenbuch/features/trips/data/data.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'trip.model.g.dart';

@HiveType(typeId: 0)
class TripHiveModel extends Trip {
  TripHiveModel() {}

  factory TripHiveModel.fromTrip(Trip trip) {
    return TripHiveModel()
      ..dateAndTime = trip.dateAndTime
      ..id = trip.id
      ..kmAbsolute = trip.kmAbsolute
      ..kmTrip = trip.kmTrip;
  }

  @override
  @HiveField(0)
  late String id;

  @override
  @HiveField(1)
  DateTime? dateAndTime;

  @override
  @HiveField(2)
  double? kmTrip;

  @override
  @HiveField(3)
  int? kmAbsolute;
}
