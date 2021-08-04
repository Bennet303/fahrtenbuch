import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fahrtenbuch/features/export/data/datasources/export.datasource.dart';
import 'package:fahrtenbuch/features/export/data/models/trip.export.model.dart';
import 'package:path_provider/path_provider.dart';

class CsvExportDataSource extends ExportDataSource {
  @override
  Future<void> export(String path, List<TripExportModel> trips) async {
    List<List<dynamic>> tripExport = trips.map((trip) => trip.toCSV()).toList();
    List<dynamic> header = [
      'Datum',
      'Uhrzeit',
      'Kilometerstand',
      'Tageskilometer',
      'Ort'
    ];
    tripExport.insert(0, header);
    String csv =
        const ListToCsvConverter(fieldDelimiter: ';').convert(tripExport);
    final directory = await getExternalStorageDirectory();

    if (directory == null) {
      throw Exception('No export directory provided');
    }

    final String exportPath = directory.path + '/' + path + '.csv';
    File file = File(exportPath);
    file.writeAsString(csv);
  }
}
