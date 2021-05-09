import 'dart:convert';
import 'dart:io';

import 'package:fahrtenbuch/models/tripModel.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class TripService {
  final RegExp dateRegEx =
      RegExp(r'^[0-3][0-9][.][0-1][0-9][.](19|20)[0-9]{2}$', multiLine: false);
  final RegExp timeRegEx =
      RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$', multiLine: false);
  final RegExp tripRegEx = RegExp(r'\d{1,5}[.]\d\s*$');
  //RegExp(r'$(?:0*(?:[0-9]|[1-9][0-9][0-9]?|[1-4][0-9][0-9][0-9])(?:[.][0-9])?|5000(?:[.]0)?)[.][0-9][\\n\\r\\s]+', multiLine: false);
  final RegExp kmRegEx = RegExp(r'\d{6}', multiLine: false); //r'$[1-9]\\d{5}'

  static final TripService _instance = TripService._internal();

  factory TripService() => _instance;

  TripService._internal() {}

  Future<TripModel> readImage() async {
    final File imageFile = await getImageFileFromAssets("20191220_161131.jpg");
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(imageFile);
    final TextRecognizer textRecognizer =
        FirebaseVision.instance.textRecognizer();
    final VisionText visionText =
        await textRecognizer.processImage(visionImage);
    String text = visionText.text;
    LineSplitter splitter = new LineSplitter();
    List<String> lines = splitter.convert(text);

    String date;
    String time;
    String trip;
    String km;

    lines.forEach((element) {
      date = dateRegEx.stringMatch(element) ?? date;
      time = timeRegEx.stringMatch(element) ?? time;
      trip = tripRegEx.stringMatch(element) ?? trip;
      km = kmRegEx.stringMatch(element) ?? km;
    });

    date.replaceAll(new RegExp(r'.'), '-');
    DateTime dateTime = DateFormat('dd.MM.yyyy HH:mm').parse(date + " " + time);
    return new TripModel(dateTime, double.tryParse(trip), int.tryParse(km));
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<Null> myGetByte() async {
    final _byteData = await rootBundle.load('assets/');
    return _byteData;
  }
}
