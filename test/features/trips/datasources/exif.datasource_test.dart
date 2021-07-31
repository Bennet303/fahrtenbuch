import 'dart:developer';
import 'dart:io';

import 'package:fahrtenbuch/features/trips/data/datasources/image-metadata/exif.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ExifDatasource exifDatasource;
  late File tImageFile;

  setUp(() {
    exifDatasource = new ExifDatasource();
    tImageFile = File('assets/20191202_074008.jpg');
  });

  test('should get the correct coordinates from provided image', () async {
    // arrange
    final tExpectedLatitude = 51.68;
    final tExpectedLongitude = 9.38;

    // act
    final CoordinatesModel res =
        await exifDatasource.getCoordinates(tImageFile);

    final actualLatitude = num.parse(res.latitude.toStringAsFixed(2));
    final actualLongitude = num.parse(res.longitude.toStringAsFixed(2));

    // assert
    expect(actualLatitude, tExpectedLatitude);
    expect(actualLongitude, tExpectedLongitude);
  });
}
