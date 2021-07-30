part of 'export_bloc.dart';

abstract class ExportState extends Equatable {
  const ExportState();
  @override
  List<Object> get props => [];
}

class ExportInitial extends ExportState {}

class ExportInProgress extends ExportState {}

class ExportCompleted extends ExportState {
  final String outputPath;

  ExportCompleted(this.outputPath);
}

class ExportFailed extends ExportState {}
