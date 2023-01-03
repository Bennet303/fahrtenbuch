import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/core/error/trip.failure.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/trip-db/trip.db.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/models/trip.model.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/domain/repositories/trip.repository.dart';

class TripRepositoryImpl extends TripRepository {
  TripDbDataSource dataSource;

  TripRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, void>> addTrip(Trip trip) async {
    try {
      TripHiveModel model = TripHiveModel.fromTrip(trip);
      return Right(await dataSource.addTrip(model));
    } catch (e) {
      return Left(TripFailure('Adding a new trip failed!'));
    }
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      List<TripHiveModel> models = await dataSource.getAllTrips();
      return Right(models);
    } catch (e) {
      return Left(TripFailure('Getting all trips failed!'));
    }
  }

  @override
  Future<Either<Failure, void>> removeTrip(Trip trip) async {
    try {
      return Right(await dataSource.deleteTrip(trip.id));
    } catch (e) {
      return Left(TripFailure('Deleting trip ${trip.id} failed!'));
    }
  }
}
