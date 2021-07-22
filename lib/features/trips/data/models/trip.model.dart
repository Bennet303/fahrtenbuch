import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:hive/hive.dart';
part 'trip.model.g.dart';

@HiveType(typeId: 0)
//ignore: must_be_immutable
class TripHiveModel extends Trip {
  TripHiveModel();

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
