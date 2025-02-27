import 'dart:async';
import 'dart:io';

import 'package:components/components/media/model/file_details.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';

class FileHandlingService{
   

  final ImagePicker _picker = ImagePicker();

  /// Pick the single File from the gallay using image_picker package.
  /// It is in the XFile format that contains bytes of the source, path,
  /// Convert it into the File format so we can access the Path, name, file format, size, etc.
  FutureOr<FileDetailsModel?> getSingleFile() async {
    XFile? singleFile = await _picker.pickImage(source: ImageSource.gallery);
    // Only convert if the User is picked the file from gallay
    if (singleFile != null) {
      File file = File(singleFile.path);
      // _singleFilePath = file.path;
      // _singleFileName = ;
      String fileName = file.path.split('/').last;
      String filePath = file.path;
      String fileSize = _convertFile(await file.length());
      return FileDetailsModel.fromJson({
        "fileName": fileName, "filePath": filePath, "fileSize": fileSize
      });
    }
    return null;
  }

  /// Pick the file from the Camera it will store the image in the cache we can convert it into 
  /// bytes and then send that to the API or store it in the local db storage (like hive)
  FutureOr<FileDetailsModel?> getCameraFile() async {
    XFile? singleFile = await _picker.pickImage(source: ImageSource.camera);
    // Only convert if the User is picked the file from gallay
    if (singleFile != null) {
      File file = File(singleFile.path);
      // _singleFilePath = file.path;
      // _singleFileName = ;
      String fileName = file.path.split('/').last;
      String filePath = file.path;
      String fileSize = _convertFile(await file.length());
      return FileDetailsModel.fromJson({
        "fileName": fileName, "filePath": filePath, "fileSize": fileSize
      });
    }
    return null;
  }

  /// Image_picker does not support to pick the multiple file types and multiple images as well
  /// But it not pick the files and can't access the camera so we need that too for some cases.
  Future<List<FileDetailsModel>> multipleFilesWithDifferentTypes() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
    if(result == null) return [];
    return Future.wait(result.files.map((file) async {
        return FileDetailsModel.fromJson({
          "fileName": file.name, 
          "filePath": file.path, 
          "fileSize": _convertFile(File(file.path!).lengthSync())
        });
      },).toList()
    );
  }

  /// This function is help to convert the Bytes into actual size of the File in conventional terms
  String _convertFile(int bytes, [int decimals = 2]) {
    if (bytes == 0) {
      return '0 B';
    }

    List<String> sizes = ['B', 'KB', 'MB', 'GB', 'TB'];
    int i = 0;
    double size = bytes.toDouble();
    
    while (size >= 1024 && i < sizes.length - 1) {
      size /= 1024;
      i++;
    }
    return "${size.toStringAsFixed(decimals)} ${sizes[i]}";
  }
  
  /// Open any files using openfilex package that is lightweight package thant open_file
  Future<void> openFile(String filePath) async  
    => await OpenFilex.open(filePath);
}