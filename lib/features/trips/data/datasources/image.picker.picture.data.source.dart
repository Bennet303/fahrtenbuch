import 'dart:io';

import 'package:fahrtenbuch/features/trips/data/datasources/picture.data.source.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPictureDataSource extends PictureDataSource {
  late final ImagePicker _picker;

  ImagePickerPictureDataSource() {
    _picker = new ImagePicker();
  }

  @override
  Future<File> choosePictureFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    return _convertPickedFileToFile(pickedFile!);
  }

  @override
  Future<File> takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    return _convertPickedFileToFile(pickedFile!);
  }

  File _convertPickedFileToFile(XFile pickedFile) {
    return File(pickedFile.path);
  }
}
