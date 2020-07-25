import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as imageCompression;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageUtilities {
  Future<File> getCompressedImage({
    @required String filePath,
    @required double width,
    @required double height,
  }) async {
    imageCompression.Image image = imageCompression.decodeImage(
      File(filePath).readAsBytesSync(),
    );

    int imageHeight = image.height;
    int imageWidth = image.width;

    double maxWidth;
    double maxHeight;
    if (imageHeight > imageWidth) {
      maxWidth = width;
      var ratio = imageHeight / imageWidth;
      maxHeight = maxWidth * ratio;
    } else {
      maxHeight = height;
      var ratio = imageWidth / imageHeight;
      maxWidth = maxHeight * ratio;
    }

    imageCompression.Image thumbnail = imageCompression.copyResize(
      image,
      width: maxWidth.toInt(),
      height: maxHeight.toInt(),
    );

    Directory tempDir = await getTemporaryDirectory();
    String path = '${tempDir.path}/${DateTime.now().toIso8601String()}.png';
    File background = File(path);
    background.writeAsBytesSync(
      imageCompression.encodePng(thumbnail),
    );

    return background;
  }

  Future<String> pickImage({@required ImageSource imageSource}) async {
    PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
    return pickedFile.path;
  }
}
