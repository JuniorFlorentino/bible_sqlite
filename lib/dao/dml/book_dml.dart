import 'package:bible_sqlite/dao/databasehelper.dart';
import 'package:bible_sqlite/models/book_model.dart';
import 'package:sqflite/sqflite.dart';

class BookDML {
  final DatabaseApp _db = DatabaseApp();
  String table = 'book';

  Future<List<BookModel>> index() async {
    Database db = await _db.initializeDatabase();
    List data = await db.query(table);

    List<BookModel> _list =
        data.isNotEmpty ? data.map((e) => BookModel.fromJson(e)).toList() : [];

    return _list;
  }
}
