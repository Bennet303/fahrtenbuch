import 'dart:io';

abstract class OcrDataSource {
  Future<List<String>> readImage(File imageFile);
  String? getDateString(List<String> lines);
  String? getTimeString(List<String> lines);
  String? getTripKmString(List<String> lines);
  String? getTotalKmString(List<String> lines);
}
