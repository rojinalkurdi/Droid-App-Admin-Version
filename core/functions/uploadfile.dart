import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

cameraUpload() async {
  final PickedFile? file = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 90) as PickedFile?;
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileGalleryUpload([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "SVG"]
          : ["PNG", "png", "JPG", "JPEG", "jpg", "jpeg", "gif"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}
