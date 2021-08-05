import 'package:fahrtenbuch/features/export/export.feature.init.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/image-metadata/exif.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/image-metadata/image.metadata.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/location/geocoding.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/location/location.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/ocr/firebase.ocr.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/picture/image.picker.picture.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/ocr/ocr.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/picture/picture.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/repositories/picture.repository.impl.dart';
import 'package:fahrtenbuch/features/trips/trips.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> init() async {
  exportFeatureInit();
  //TODO: split up into Feature inits
  //TODO: add export feature

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
  injector
      .registerLazySingleton<LocationDatasource>(() => GeocodingDatasource());

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
