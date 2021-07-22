import 'package:fahrtenbuch/features/trips/data/models/trip.model.dart';

abstract class TripDbDataSource {
  Future<List<TripHiveModel>> getAllTrips();
  Future<void> addTrip(TripHiveModel trip);
  Future<void> deleteTrip(String id);
}
