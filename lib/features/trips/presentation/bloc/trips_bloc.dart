import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fahrtenbuch/features/trips/domain/entities/trip.dart';
import 'package:fahrtenbuch/features/trips/domain/usecases/add.trip.dart';
import 'package:fahrtenbuch/features/trips/domain/usecases/get.trips.dart';
part 'trips_event.dart';
part 'trips_state.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final AddTripUsecase addTrip;
  final GetTripsUsecase getTrips;

  TripsBloc({required this.getTrips, required this.addTrip})
      : super(TripsInitial());
  @override
  Stream<TripsState> mapEventToState(
    TripsEvent event,
  ) async* {
    if (event is AddTrip) {
      yield AddingTripLoadingState();
      final res = await addTrip(event.trip);
      yield res.fold(
        (failure) => AddingTripFailedState(),
        (success) => AddingTripCompletedState(),
      );
      return;
    }

    if (event is GetTrips) {
      yield GettingTripsLoadingState();
      final res = await getTrips();
      yield res.fold(
        (failure) => GettingTripsFailedState(),
        (trips) => GettingTripsCompletedState(trips),
      );
    }
  }
}
