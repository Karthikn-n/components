import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'files.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE files(id INTEGER PRIMARY KEY AUTOINCREMENT, path TEXT)",
        );
      },
    );
  }

  static Future<int> saveFilePath(String path) async {
    final db = await database;
    return await db.insert("files", {"path": path});
  }

  static Future<List<String>> getSavedFiles() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.query("files");
    return result.map((e) => e["path"] as String).toList();
  }
}
