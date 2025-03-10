import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {

  static final HiveHelper _helper = HiveHelper._internal();

  /// This will create the database when it is initialized 
  static late BoxCollection db;
  static late CollectionBox collection;

  /// Like the Database in the SQL database it have the [BoxCollection] and for the table alternative
  /// [Box]
  Future<void> initializeHive() async {
    Directory? extdir = await getExternalStorageDirectory();
    /// Create the new Folder inside the Files folder for this No-SQL database server
    String filePath = "${extdir!.path}/components/hive";
    db = await BoxCollection.open(
      'my_files', 
      {'files'},
      path: filePath
    );
    /// Once the box is created open the box for the future use 
    collection =  await db.openBox("files");
  }

  Future<void> addFiles(List<Map<String, dynamic>> files) async {
    final box = Hive.box<Map<String, dynamic>>('files');

    // Convert list to a map where key = user ID, value = user object
    Map<int, Map<String, dynamic>> fileMap = {for (var file in files) file["id"]!: file};

    await box.putAll(fileMap);
  }


  Future<void> putData(Map<String, dynamic> dataList, String doc) async 
    => await Hive.box(doc).putAll(dataList);

  Future<List<Map<String, dynamic>>> getAllValues(String doc) async 
    =>  Hive.box<Map<String, dynamic>>(doc).values.toList();

  Future<Map<String, dynamic>?> getFile(int id) async 
    => Hive.box<Map<String, dynamic>>('files').get(id); 

  Future<void> updateFile(Map<String, dynamic> updatedFile) async {
    final box = Hive.box<Map<String, dynamic>?>('files');

    if (box.containsKey(updatedFile["id"])) {
      await box.put(updatedFile["id"], updatedFile);
      print("File Updated: ${updatedFile["fileName"]}");
    } else {
      print("File Not Found");
    }
  } 

  Future<void> deleteFile(int id) async {
    final box = Hive.box<Map<String, dynamic>>('files');
    
    if (box.containsKey(id)) {
      await box.delete(id);
      print("File Deleted: $id");
    } else {
      print("File Not Found");
    }
  }


  Future<void> deleteAllFiles() async 
    => await Hive.box<Map<String, dynamic>>('files').clear();
  


  factory HiveHelper() => _helper;
  HiveHelper._internal();
}