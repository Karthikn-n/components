import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

class DatabaseHelper extends WidgetsBindingObserver{
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? db;

  /// Initialize the database on where we need it because if we initialize before the use case it may 
  /// increase the size of the app
  /// This will create the folder inside the external storage directory of the folder called files for storing database
  Future<void> initDatabase() async {
    /// Get the application external directory 
    Directory? externalDir = await getExternalStorageDirectory();
    if (externalDir == null) {
      print("External storage directory not found!");
    }
    /// Create the new folder inside the External directory to keep the files safe
    String folderPath = "${externalDir!.path}/components/sqflite";
    Directory newFolder = Directory(folderPath);
    if (!newFolder.existsSync()) {
      newFolder.createSync(recursive: true);
      print("Folder created at: $folderPath");
    } 
    /// To check the existion of File use the [File] for folders use [Directory]
    if((db != null && !db!.isOpen)  || !File("$folderPath/my_files.db").existsSync()){
      /// It will connect the folder path into the db file we can use [path] package as well
      String path = "${newFolder.path}/my_files.db"; // join(newFolder.path, 'my_files.db')
      /// Open the database at the location with one table
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''
            CREATE TABLE files(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              fileName TEXT,
              filePath TEXT,
              fileSize TEXT
            )
          ''');
        },
      );
    }
  }

  /// Insert the new files in the same database it will throw the excepetion
  Future<int> insertFile(Map<String, dynamic> file) async 
    => await db!.insert('files', file);

  /// This function is get all the Files from the database without any filtering
  Future<List<Map<String, dynamic>>> getFiles() async 
    => await db!.query('files');

  /// If want to update the same or replace the file with new file we can use this function
  Future<int> updateFile(int id, Map<String, dynamic> user) async 
    => await db!.update('files', user, where: 'id = ?', whereArgs: [id]);
  
  /// This will delete the specific files from the database
  Future<int> deleteFile(int id) async 
    => await db!.delete('files', where: 'id = ?', whereArgs: [id]);
  
  /// If the user is logout and login from the new id we can close the database or we can use the same table with 
  /// different id it not
  Future<void> closeDatabase() async 
    => db!.close();

  /// If user id deleting account from their device we need to remove their data from device
  /// for storage concerns
  Future<void> deleteDb() async {
    Directory? externalDir = await getExternalStorageDirectory();
    String folderPath = "${externalDir!.path}/components/sqflite/my_files.db";
    if (await File(folderPath).exists()) {
      await File(folderPath).delete();
      print("Database deleted successfully.");
      db = null; // Reset database instance
    }
  }
  
  /// If the user want to delete all the files from the list by clicking select all we can drop the whole table
  Future<void> deleteTable(String tableName) async 
    => await db!.execute('DROP TABLE IF EXISTS $tableName');

  /// This will close the database if the app is in background or terminated for 
  /// preventing any data leakage
  void registerLifecycleObserver() {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached || state == AppLifecycleState.inactive) {
      closeDatabase();
    }
  }
}
