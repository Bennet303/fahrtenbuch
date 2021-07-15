import 'package:fahrtenbuch/features/trips/trips.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
Future<void> init() async {
  ///* Feature: Trips
  //* Bloc
  injector.registerFactory<TripsBloc>(
      () => TripsBloc(addTrip: injector(), getTrips: injector()));

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
