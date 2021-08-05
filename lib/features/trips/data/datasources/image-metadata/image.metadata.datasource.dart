import 'dart:io';

import 'package:fahrtenbuch/features/trips/data/models/coordinates.model.dart';

abstract class ImageMetadataDatasource {
  Future<CoordinatesModel> getCoordinates(File imageFile);
}
