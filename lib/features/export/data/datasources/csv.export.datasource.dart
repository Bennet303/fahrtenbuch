import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fahrtenbuch/features/export/data/datasources/export.datasource.dart';
import 'package:fahrtenbuch/features/export/data/models/trip.export.model.dart';
import 'package:path_provider/path_provider.dart';

class CsvExportDataSource extends ExportDataSource {
  @override
  Future<void> export(String path, List<TripExportModel> trips) async {
    String csv = convertTripsToCSV(trips);
    File file = File(await getExportPath(path));
    file.writeAsString(csv);
  }

  Future<String> getExportPath(String fileName) async {
    final directory = await getExternalStorageDirectory();

    if (directory == null) {
      throw Exception('No export directory provided');
    }

    return directory.path + '/' + fileName + '.csv';
  }

  String convertTripsToCSV(List<TripExportModel> trips) {
    List<List<dynamic>> tripExport = trips.map((trip) => trip.toCSV()).toList();
    List<dynamic> header = [
      'Datum',
      'Uhrzeit',
      'Kilometerstand',
      'Tageskilometer',
      'Ort'
    ];
    tripExport.insert(0, header);
    return const ListToCsvConverter(fieldDelimiter: ';').convert(tripExport);
  }
}
