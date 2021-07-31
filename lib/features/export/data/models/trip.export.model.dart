import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:intl/intl.dart';

class TripExportModel extends Trip {
  TripExportModel(DateTime dateTime, String id, int kmAbsolute, double kmTrip) {
    this.dateAndTime = dateTime;
    this.id = id;
    this.kmAbsolute = kmAbsolute;
    this.location = location;
    this.kmTrip = kmTrip;
  }

  factory TripExportModel.fromTrip(Trip trip) {
    final res = new TripExportModel(
        trip.dateAndTime!, trip.id, trip.kmAbsolute!, trip.kmTrip!);
    return res;
  }

  List<dynamic> toCSV() {
    return [
      DateFormat('dd.MM.yyyy').format(this.dateAndTime!),
      DateFormat('HH:mm').format(this.dateAndTime!),
      this.kmTrip,
      this.kmAbsolute,
      this.location,
    ];
  }
}
