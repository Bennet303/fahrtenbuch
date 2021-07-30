import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fahrtenbuch/features/export/domain/usecases/export.month.usecase.dart';
part 'export_event.dart';
part 'export_state.dart';

class ExportBloc extends Bloc<ExportEvent, ExportState> {
  final ExportMonthUsecase exportMonthUsecase;

  ExportBloc(this.exportMonthUsecase) : super(ExportInitial());
  @override
  Stream<ExportState> mapEventToState(
    ExportEvent event,
  ) async* {
    if (event is StartExport) {
      yield ExportInProgress();
      final res = await exportMonthUsecase(event.month);
      yield res.fold((l) => ExportFailed(), (r) => ExportCompleted(''));
    }
  }
}
