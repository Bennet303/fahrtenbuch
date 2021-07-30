import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';

class TripExportModel extends Trip {
  TripExportModel();

  factory TripExportModel.fromTrip(Trip trip) {
    return TripExportModel()
      ..dateAndTime = trip.dateAndTime
      ..id = trip.id
      ..kmAbsolute = trip.kmAbsolute
      ..kmTrip = trip.kmTrip;
  }

  List<dynamic> toCSV() {
    return [
      this.dateAndTime,
      this.kmTrip,
      this.kmAbsolute,
    ];
  }
}
