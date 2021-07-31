import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Trip extends Equatable {
  late String id;
  DateTime? dateAndTime;
  double? kmTrip;
  int? kmAbsolute;
  String? location;

  Trip({this.dateAndTime, this.kmTrip, this.kmAbsolute, this.location}) {
    id = Uuid().v1();
  }

  @override
  List<Object?> get props => [id];
}
