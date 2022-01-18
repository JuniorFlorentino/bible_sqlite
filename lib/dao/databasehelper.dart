import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseApp {
  static DatabaseApp? _databaseHelper;
  static Database? _database;

  DatabaseApp._createInstance();

  factory DatabaseApp() {
    // ignore: prefer_conditional_assignment
    if (_databaseHelper == null) {
      // executado somente uma vez
      _databaseHelper = DatabaseApp._createInstance();
    }
    return _databaseHelper!;
  }

  Future<Database> get database async {
    // ignore: prefer_conditional_assignment
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "demo_asset_example.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle
          .load(join("packages/bible_sqlite/assets/", "ACF.sqlite"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {}
// open the database
    return await openDatabase(path, readOnly: true);
  }
}
