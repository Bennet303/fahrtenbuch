import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/trips/domain/domain.dart';

class GenerateTripPictureGalleryUsecase {
  final PictureRepository repository;

  GenerateTripPictureGalleryUsecase(this.repository);

  Future<Either<Failure, Trip>> call() {
    return repository.getTripFromImageGallery();
  }
}
