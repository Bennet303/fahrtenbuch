import 'package:fahrtenbuch/core/dependency.injector.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/location/geocoding.rest.datasource.dart';
import 'package:fahrtenbuch/features/trips/domain/usecases/usecases.dart';
import 'package:fahrtenbuch/features/trips/presentation/bloc/bloc.dart';

import 'data/datasources/image-metadata/exif.datasource.dart';
import 'data/datasources/image-metadata/image.metadata.datasource.dart';
import 'data/datasources/location/location.datasource.dart';
import 'data/datasources/ocr/firebase.ocr.data.source.dart';
import 'data/datasources/ocr/ocr.data.source.dart';
import 'data/datasources/picture/image.picker.picture.data.source.dart';
import 'data/datasources/picture/picture.data.source.dart';
import 'data/datasources/trip-db/trip.db.data.source.dart';
import 'data/datasources/trip-db/trip.db.data.source.impl.dart';
import 'data/repositories/picture.repository.impl.dart';
import 'data/repositories/repositories.dart';
import 'domain/repositories/repositories.dart';

tripsFeatureInit() {
  ///* Feature: Picture
  //* Bloc
  injector.registerFactory<PictureBloc>(
    () => PictureBloc(
      generateTripPictureCameraUsecase: injector(),
      generateTripPictureGalleryUsecase: injector(),
    ),
  );

  //* Use Cases
  injector.registerLazySingleton<GenerateTripPictureGalleryUsecase>(
    () => GenerateTripPictureGalleryUsecase(injector()),
  );

  injector.registerLazySingleton<GenerateTripPictureCameraUsecase>(
    () => GenerateTripPictureCameraUsecase(injector()),
  );

  //* Repositories
  injector.registerLazySingleton<PictureRepository>(
    () => PictureRepositoryImpl(
      ocrDataSource: injector(),
      pictureDataSource: injector(),
      locationDatasource: injector(),
      imageMetadataDatasource: injector(),
    ),
  );

  //* Data Sources
  injector.registerLazySingleton<OcrDataSource>(() => GoogleOcrDataSource());
  injector.registerLazySingleton<PictureDataSource>(
      () => ImagePickerPictureDataSource());
  injector
      .registerLazySingleton<ImageMetadataDatasource>(() => ExifDatasource());
  injector.registerLazySingleton<LocationDatasource>(
      () => GeocodingRestDataSource());

  ///* Feature: Trips
  //* Bloc
  injector.registerFactory<TripsBloc>(() => TripsBloc(
      addTrip: injector(), getTrips: injector(), deleteTrip: injector()));

  //* Use Cases
  injector.registerLazySingleton<GetTripsUsecase>(
    () => GetTripsUsecase(injector()),
  );
  injector.registerLazySingleton<AddTripUsecase>(
    () => AddTripUsecase(injector()),
  );
  injector.registerLazySingleton<DeleteTripUsecase>(
    () => DeleteTripUsecase(injector()),
  );

  //* Repositories
  injector.registerLazySingleton<TripRepository>(
      () => TripRepositoryImpl(dataSource: injector()));

  //* Data Sources
  injector
      .registerLazySingleton<TripDbDataSource>(() => TripDbDataSourceImpl());
}
