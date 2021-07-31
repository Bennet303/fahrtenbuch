import 'package:fahrtenbuch/features/trips/data/datasources/trip-db/trip.db.data.source.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fahrtenbuch/features/trips/data/models/trip.model.dart';

class TripDbDataSourceImpl extends TripDbDataSource {
  Box<TripHiveModel> _getTripBox() {
    return Hive.box<TripHiveModel>('trips');
  }

  @override
  Future<void> addTrip(TripHiveModel trip) async {
    var box = _getTripBox();
    await box.put(trip.id.toString(), trip);
  }

  @override
  Future<void> deleteTrip(String id) async {
    var box = _getTripBox();
    await box.delete(id);
  }

  @override
  Future<List<TripHiveModel>> getAllTrips() async {
    var box = _getTripBox();
    return (box.values).toList();
  }
}
