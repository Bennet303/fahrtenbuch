import 'dart:convert';
import 'dart:io';

//import 'package:firebase_ml_vision/firebase_ml_vision.dart';

import 'package:google_ml_kit/google_ml_kit.dart';

import 'ocr.data.source.dart';

class GoogleOcrDataSource extends OcrDataSource {
  @override
  String? getDateString(List<String> lines) {
    final RegExp dateRegEx = RegExp(
        r'^[0-3][0-9][.][0-1][0-9][.](19|20)[0-9]{2}$',
        multiLine: false);
    return _getMatch(dateRegEx, lines);
  }

  @override
  String? getTimeString(List<String> lines) {
    final RegExp timeRegEx =
        RegExp(r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$', multiLine: false);
    return _getMatch(timeRegEx, lines);
  }

  @override
  String? getTotalKmString(List<String> lines) {
    final RegExp kmRegEx = RegExp(r'\d{6}', multiLine: false);
    return _getMatch(kmRegEx, lines);
  }

  @override
  String? getTripKmString(List<String> lines) {
    final RegExp tripRegEx = RegExp(r'\d{1,5}[.]\d\s*$');
    return _getMatch(tripRegEx, lines);
  }

  String? _getMatch(RegExp regExp, List<String> lines) {
    String? result;
    for (String element in lines) {
      result = regExp.stringMatch(element);
      if (result != null) {
        break;
      }
    }
    return result;
  }

  @override
  Future<List<String>> readImage(File imageFile) async {
    LineSplitter splitter = new LineSplitter();

    final textdetector = GoogleMlKit.vision.textDetector();

    final visionImage = InputImage.fromFile(imageFile);

    final recognisedText = await textdetector.processImage(visionImage);

    return splitter.convert(recognisedText.text);
  }
}
