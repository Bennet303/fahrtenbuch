import 'package:fahrtenbuch/features/trips/data/datasources/firebase.ocr.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/image.picker.picture.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/ocr.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/picture.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/repositories/picture.repository.impl.dart';
import 'package:fahrtenbuch/features/trips/trips.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> init() async {
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
        ocrDataSource: injector(), pictureDataSource: injector()),
  );

  //* Data Sources
  injector.registerLazySingleton<OcrDataSource>(() => GoogleOcrDataSource());
  injector.registerLazySingleton<PictureDataSource>(
      () => ImagePickerPictureDataSource());

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
