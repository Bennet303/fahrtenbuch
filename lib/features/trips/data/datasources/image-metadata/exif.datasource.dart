import 'dart:io';

import 'package:exif/exif.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/image-metadata/image.metadata.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';

class ExifDatasource extends ImageMetadataDatasource {
  @override
  Future<CoordinatesModel> getCoordinates(File imageFile) async {
    Map<String, IfdTag> data = await readExifFromFile(imageFile);

    if (data.isEmpty) throw Exception('No EXIF data found in image file');
    return _exifGPSToCooridnateModel(data);
  }

  CoordinatesModel _exifGPSToCooridnateModel(Map<String, IfdTag> data) {
    final latitudeValue =
        _mapLangLatToDoubleList(data['GPS GPSLatitude']!.values);
    final latitudeSignal = data['GPS GPSLatitudeRef']!.printable;

    final longitudeValue =
        _mapLangLatToDoubleList(data['GPS GPSLongitude']!.values);
    final longitudeSignal = data['GPS GPSLongitudeRef']!.printable;

    double latitude = _latLangToDouble(latitudeValue);
    double longitude = _latLangToDouble(longitudeValue);

    if (latitudeSignal == 'S') latitude = -latitude;
    if (longitudeSignal == 'W') longitude = -longitude;

    return CoordinatesModel(latitude, longitude);
  }

  double _latLangToDouble(List<double> latLang) {
    return latLang[0] + (latLang[1] / 60) + (latLang[2] / 3600);
  }

  List<double> _mapLangLatToDoubleList(IfdValues values) {
    return values
        .toList()
        .map<double>(
          (item) => (item.numerator.toDouble() / item.denominator.toDouble()),
        )
        .toList();
  }
}
