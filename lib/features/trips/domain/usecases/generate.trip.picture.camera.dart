import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/domain.dart';

class GenerateTripPictureCameraUsecase {
  final PictureRepository repository;

  GenerateTripPictureCameraUsecase(this.repository);

  Future<Either<Failure, Trip>> call() {
    return repository.getTripFromImageCamera();
  }
}
