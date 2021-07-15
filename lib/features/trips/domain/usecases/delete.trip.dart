import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/domain/repositories/trip.repository.dart';

class DeleteTripUsecase {
  final TripRepository repository;

  DeleteTripUsecase(this.repository);

  Future<Either<Failure, void>> call(Trip trip) {
    return repository.removeTrip(trip);
  }
}
