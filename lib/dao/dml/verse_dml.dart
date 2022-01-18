import 'package:bible_sqlite/dao/databasehelper.dart';
import 'package:bible_sqlite/models/verse_model.dart';
import 'package:sqflite/sqflite.dart';

class VerseDMl {
  final DatabaseApp _db = DatabaseApp();
  String table = 'verse';

  Future<List<VerseModel>> index({required int booId}) async {
    Database db = await _db.initializeDatabase();
    List data = await db.query(table, where: 'bookId = ?', whereArgs: [booId]);

    List<VerseModel> _list =
        data.isNotEmpty ? data.map((e) => VerseModel.fromJson(e)).toList() : [];

    return _list;
  }
}
