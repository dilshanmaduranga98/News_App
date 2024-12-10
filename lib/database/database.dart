import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:quiz_assigment/models/news_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [NewsItems])
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  Future<int> addNews(NewsItemsCompanion entry) {
    return into(newsItems).insert(entry);
  }
  Future<List<NewsItem>> selectNews() {
    return select(newsItems).get();
  }
  
  
  Future<NewsItem?> selectOneNews(int newsId) {
    return (select(newsItems)..where((n) =>n.id.equals(newsId))).getSingleOrNull();
  }


  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}