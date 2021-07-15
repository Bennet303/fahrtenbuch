import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Trip extends Equatable {
  late final String id;
  final DateTime? dateAndTime;
  final double? kmTrip;
  final int? kmAbsolute;

  Trip({this.dateAndTime, this.kmTrip, this.kmAbsolute}) {
    id = Uuid().v1();
  }

  @override
  List<Object?> get props => [id];
}
