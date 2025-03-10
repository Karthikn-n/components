import 'dart:developer';
import 'dart:io';

import 'package:components/components/sync/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

enum Status{success, failed, error}

class LocalDbService {

  static final LocalDbService _dbService = LocalDbService._internal();
  static Database? db;

  static Future<void> initDatabase() async {
    print("Initializing");
    Directory? extDir = await getExternalStorageDirectory();
    /// Create the New folder for storing the App database files
    String filePath = join(extDir!.path, "components", "sqflite"); // Use path package for more compaitable over concatenation
    Directory folder = Directory(filePath);
    if(!folder.existsSync()) folder.createSync(recursive: true);
    print("Folder creation Success");
    if(!db!.isOpen) {
      db = await openDatabase(
        join(filePath, "data.db"),
        version: 1,
        onCreate: (db, version) {
          db.execute('''CREATE TABLE posts(
            id INTEGER PRIMARY KEY,
            userId INTEGER,
            title TEXT,
            body TEXT
          )'''
          );
        },
      );
      debugPrint("Database opened");
    }
    debugPrint("Database already opened");
  }

  /// Load all the Data that is fetched from the API Client
  static Future<Status> addPosts(List<PostModel> posts) async {
    // Batch is faster that insert() because of await
    try {
        final batch = db!.batch();
        print("Addeding to local db");
        for (var post in posts) {
          batch.insert("posts", post.toJson(), conflictAlgorithm: ConflictAlgorithm.replace); 
        }
        /// execute all Insertions at once  
        await batch.commit(noResult: true);
        print("Added");
        return Status.success;
    } catch (e, st) {
      log("DB insertaion failed", error: e.toString(), stackTrace: st);
      return Status.failed;
    }
  }

  /// Get all the POSTs from the Database if the Device is on offline 
  static Future<List<PostModel>> getAllPosts() async {
    final postsDb = await db!.query("posts");
    await db!.close();
    if (postsDb.isEmpty) {
      debugPrint("No posts found in local DB.");
    }
    return postsDb.map((post) => PostModel.fromJson(post),).toList();
  }

  factory LocalDbService() => _dbService;
  LocalDbService._internal();
}