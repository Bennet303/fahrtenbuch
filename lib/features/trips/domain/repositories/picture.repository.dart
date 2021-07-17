import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';

abstract class PictureRepository {
  Future<Either<Failure, Trip>> getTripFromImageGallery();
  Future<Either<Failure, Trip>> getTripFromImageCamera();
}
