import 'package:fahrtenbuch/features/trips/data/models/trip.model.dart';
import 'package:uuid/uuid.dart';

abstract class TripDbDataSource {
  Future<List<TripHiveModel>> getAllTrips();
  Future<void> addTrip(TripHiveModel trip);
  Future<void> deleteTrip(String id);
}
