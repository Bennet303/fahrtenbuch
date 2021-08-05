import 'dart:io';

abstract class PictureDataSource {
  Future<File> takePicture();
  Future<File> choosePictureFromGallery();
}
