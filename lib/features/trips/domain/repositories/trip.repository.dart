import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';

abstract class TripRepository {
  Future<Either<Failure, void>> addTrip(Trip trip);
  Future<Either<Failure, void>> removeTrip(Trip trip);
  Future<Either<Failure, List<Trip>>> getTrips();
}
