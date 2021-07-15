import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/domain/repositories/trip.repository.dart';

class GetTripsUsecase {
  final TripRepository repository;

  GetTripsUsecase(this.repository);

  Future<Either<Failure, List<Trip>>> call() {
    return repository.getTrips();
  }
}
