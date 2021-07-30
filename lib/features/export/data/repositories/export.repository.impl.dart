import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/export.failure.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/features/export/data/datasources/export.datasource.dart';
import 'package:fahrtenbuch/features/export/data/models/trip.export.model.dart';
import 'package:fahrtenbuch/features/export/domain/repositories/export.repository.dart';
import 'package:fahrtenbuch/features/trips/trips.dart';

class ExportRepositoryImpl extends ExportRepository {
  final TripDbDataSource tripDbDataSource;
  final ExportDataSource exportDataSource;

  ExportRepositoryImpl(this.tripDbDataSource, this.exportDataSource);

  @override
  Future<Either<Failure, void>> export(
      String name, DateTime from, DateTime to) async {
    try {
      // get all Trips
      List<Trip> tripsToBeExported = (await tripDbDataSource.getAllTrips())
          .where((trip) =>
              trip.dateAndTime!.compareTo(from) >= 1 &&
              trip.dateAndTime!.compareTo(to) <= 1)
          .toList();

      List<TripExportModel> tripExportModels = tripsToBeExported
          .map((trip) => TripExportModel.fromTrip(trip))
          .toList();

      // export
      return Right(exportDataSource.export(name, tripExportModels));
    } catch (e) {
      return Left(ExportFailure("Export Failed"));
    }
  }
}
