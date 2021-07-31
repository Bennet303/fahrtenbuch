import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fahrtenbuch/core/error/failure.dart';
import 'package:fahrtenbuch/core/error/picture.failure.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/image-metadata/image.metadata.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/location/location.datasource.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/ocr/ocr.data.source.dart';
import 'package:fahrtenbuch/features/trips/data/datasources/picture/picture.data.source.dart';
import 'package:fahrtenbuch/features/trips/domain/domain.dart';
import 'package:intl/intl.dart';

class PictureRepositoryImpl extends PictureRepository {
  final OcrDataSource ocrDataSource;
  final PictureDataSource pictureDataSource;
  final ImageMetadataDatasource imageMetadataDatasource;
  final LocationDatasource locationDatasource;

  PictureRepositoryImpl({
    required this.ocrDataSource,
    required this.pictureDataSource,
    required this.imageMetadataDatasource,
    required this.locationDatasource,
  });

  @override
  Future<Either<Failure, Trip>> getTripFromImageCamera() async {
    try {
      File image = await pictureDataSource.takePicture();
      Trip trip = await _getTripFromImage(image);
      return Right(trip);
    } catch (e) {
      return Left(PictureFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Trip>> getTripFromImageGallery() async {
    try {
      File image = await pictureDataSource.choosePictureFromGallery();
      Trip trip = await _getTripFromImage(image);
      return Right(trip);
    } catch (e) {
      return Left(PictureFailure(e.toString()));
    }
  }

  Future<String> _getLocation(File image) async {
    final coords = await imageMetadataDatasource.getCoordinates(image);
    final location = await locationDatasource.getLocationName(coords);
    return location;
  }

  Future<Trip> _getTripFromImage(File image) async {
    List<String> ocrResult = await ocrDataSource.readImage(image);
    final date = ocrDataSource.getDateString(ocrResult);
    final time = ocrDataSource.getTimeString(ocrResult);

    String? tripKm = ocrDataSource.getTripKmString(ocrResult);
    String? totalKm = ocrDataSource.getTotalKmString(ocrResult);

    String? location = await _getLocation(image);

    return _parseAndCreateTrip(
      date: date,
      time: time,
      tripKm: tripKm,
      totalKm: totalKm,
      location: location,
    );
  }

  Trip _parseAndCreateTrip({
    String? date,
    String? time,
    String? tripKm,
    String? totalKm,
    String? location,
  }) {
    DateTime? dateAndTime;
    if (date != null && time != null)
      dateAndTime = DateFormat('dd.MM.yyyy HH:mm').parse(date + " " + time);

    Trip trip = new Trip(
      dateAndTime: dateAndTime,
      kmAbsolute: totalKm != null ? int.tryParse(totalKm) : null,
      kmTrip: tripKm != null ? double.tryParse(tripKm) : null,
      location: location,
    );
    return trip;
  }
}
