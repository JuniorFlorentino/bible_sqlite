import 'package:bible_sqlite/dao/databasehelper.dart';
import 'package:bible_sqlite/models/testament_model.dart';
import 'package:sqflite/sqflite.dart';

class TestamentDML {
  final DatabaseApp _db = DatabaseApp();
  String table = 'testament';

  Future<List<TestamentModel>> index() async {
    Database db = await _db.initializeDatabase();
    List data = await db.query(table);

    List<TestamentModel> _list = data.isNotEmpty
        ? data.map((e) => TestamentModel.fromJson(e)).toList()
        : [];

    return _list;
  }
}
