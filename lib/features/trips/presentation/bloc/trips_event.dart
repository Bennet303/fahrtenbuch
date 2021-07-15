part of 'trips_bloc.dart';

abstract class TripsEvent extends Equatable {
  const TripsEvent();

  @override
  List<Object?> get props => [];
}

class AddTrip extends TripsEvent {
  final Trip trip;

  AddTrip(this.trip);

  @override
  List<Object?> get props => [trip];
}

class GetTrips extends TripsEvent {}

class DeleteTrip extends TripsEvent {
  final Trip trip;

  DeleteTrip(this.trip);

  @override
  List<Object?> get props => [trip];
}
