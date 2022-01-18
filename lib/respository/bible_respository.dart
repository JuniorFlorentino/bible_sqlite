import 'package:bible_sqlite/dao/dml/book_dml.dart';
import 'package:bible_sqlite/dao/dml/metadata_dml.dart';
import 'package:bible_sqlite/dao/dml/testament_dml.dart';
import 'package:bible_sqlite/dao/dml/verse_dml.dart';
import 'package:bible_sqlite/models/book_model.dart';
import 'package:bible_sqlite/models/metadata_model.dart';
import 'package:bible_sqlite/models/testament_model.dart';
import 'package:bible_sqlite/models/verse_model.dart';

class BibleSqlite {
  Future<List<BookModel>> getBook() async {
    return BookDML().index();
  }

  Future<List<VerseModel>> getVerse({required int bookId}) async {
    return VerseDMl().index(booId: bookId);
  }

  Future<List<TestamentModel>> getTestament() async {
    return TestamentDML().index();
  }

  Future<List<MetaDataModel>> getMetadata() async {
    return MetadataDML().index();
  }
}
