part of 'trips_bloc.dart';

abstract class TripsState extends Equatable {
  const TripsState();
  @override
  List<Object> get props => [];
}

class TripsInitial extends TripsState {}

class DeletingTripFailedState extends TripsState {}

class AddingTripFailedState extends TripsState {}

class GettingTripsFailedState extends TripsState {}

class DeletingTripLoadingState extends TripsState {}

class AddingTripLoadingState extends TripsState {}

class GettingTripsLoadingState extends TripsState {}

class DeletingTripCompletedState extends TripsState {}

class AddingTripCompletedState extends TripsState {}

class GettingTripsCompletedState extends TripsState {
  final List<Trip> trips;

  GettingTripsCompletedState(this.trips);

  @override
  List<Object> get props => [trips];
}
