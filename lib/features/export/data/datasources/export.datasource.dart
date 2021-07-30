import 'package:fahrtenbuch/features/export/data/models/trip.export.model.dart';

abstract class ExportDataSource {
  Future<void> export(String path, List<TripExportModel> trips);
}
