import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fahrtenbuch/features/trips/domain/domain.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';

part 'picture_event.dart';
part 'picture_state.dart';

class PictureBloc extends Bloc<PictureEvent, PictureState> {
  final GenerateTripPictureCameraUsecase generateTripPictureCameraUsecase;
  final GenerateTripPictureGalleryUsecase generateTripPictureGalleryUsecase;

  PictureBloc({
    required this.generateTripPictureCameraUsecase,
    required this.generateTripPictureGalleryUsecase,
  }) : super(PictureInitial());

  @override
  Stream<PictureState> mapEventToState(
    PictureEvent event,
  ) async* {
    if (event is GetTripFromCamera) {
      yield TripFromPictureLoading();
      final res = await this.generateTripPictureCameraUsecase();
      yield res.fold(
        (failure) => TripFromPictureFailed(),
        (trip) => TripFromPictureLoaded(trip),
      );
    }

    if (event is GetTripFromGallery) {
      yield TripFromPictureLoading();
      final res = await this.generateTripPictureGalleryUsecase();
      yield res.fold(
        (failure) => TripFromPictureFailed(),
        (trip) => TripFromPictureLoaded(trip),
      );
    }
  }
}
