import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';

abstract class ExportRepository {
  Future<Either<Failure, void>> export(String name, DateTime from, DateTime to);
}
