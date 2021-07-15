import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  Failure(this.message, [List properties = const <dynamic>[]]) : super();

  @override
  List<Object?> get props => [message];
}
