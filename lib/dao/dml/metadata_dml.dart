import 'package:bible_sqlite/dao/databasehelper.dart';
import 'package:bible_sqlite/models/metadata_model.dart';
import 'package:sqflite/sqflite.dart';

class MetadataDML {
  final DatabaseApp _db = DatabaseApp();
  String table = 'metadata';

  Future<List<MetaDataModel>> index() async {
    Database db = await _db.initializeDatabase();
    List data = await db.query(table);

    List<MetaDataModel> _list = data.isNotEmpty
        ? data.map((e) => MetaDataModel.fromJson(e)).toList()
        : [];

    return _list;
  }
}
