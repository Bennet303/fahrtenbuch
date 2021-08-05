import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/core/utils/date.helper.dart';
import 'package:fahrtenbuch/features/export/domain/repositories/export.repository.dart';

class ExportMonthUsecase {
  final ExportRepository exportRepository;

  ExportMonthUsecase(this.exportRepository);

  Future<Either<Failure, void>> call(DateTime monthAndYear) {
    final String name = _getName(monthAndYear);

    final DateTime firstDayOfMonth =
        DateHelper.getFirstDayOfMonth(monthAndYear);
    final DateTime lastDayOfMonth = DateHelper.getLastDayOfMonth(monthAndYear);

    return exportRepository.export(name, firstDayOfMonth, lastDayOfMonth);
  }

  _getName(monthAndYear) {
    final month = DateHelper.getMonthName(monthAndYear);
    return "$month - ${monthAndYear.year.toString()}";
  }
}
