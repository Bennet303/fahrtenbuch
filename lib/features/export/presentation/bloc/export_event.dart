part of 'export_bloc.dart';

abstract class ExportEvent extends Equatable {
  const ExportEvent();
}

class StartExport extends ExportEvent {
  final DateTime month;

  StartExport(this.month);

  @override
  List<Object?> get props => [month];
}
