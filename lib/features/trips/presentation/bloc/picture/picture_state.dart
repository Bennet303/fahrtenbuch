part of 'picture_bloc.dart';

abstract class PictureState extends Equatable {
  const PictureState();

  @override
  List<Object> get props => [];
}

class PictureInitial extends PictureState {}

class TripFromPictureLoading extends PictureState {}

class TripFromPictureLoaded extends PictureState {
  final Trip trip;

  TripFromPictureLoaded(this.trip);
}

class TripFromPictureFailed extends PictureState {}
