import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:mime_type/mime_type.dart' as mime;
import 'package:path/path.dart' as path;

class FileUtilities {
  String getMimeType({
    @required File file,
    @required String type,
  }) {
    String fileName = path.basename(file.path);
    String mimeType = mime.mime(fileName);
    if (mimeType != null) {
      return mimeType;
    } else {
      return null;
    }
  }

  Future<File> pickFile({List<String> allowedExtensions}) async {
    List<String> extensions = [];

    //TODO : Default allowed Extensions
    extensions.add('jpg');
    extensions.add('jpeg');
    extensions.add('png');
    extensions.add('pdf');

    //TODO : Rest all Extensions
    if (allowedExtensions.isNotEmpty) {
      for (var extension in allowedExtensions) {
        //TODO : Checking if default extension is passed and not adding it
        if (!extensions.contains(extension)) {
          extensions.add(extension);
        }
      }
    }

    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: extensions,
    );

    return file;
  }
}
