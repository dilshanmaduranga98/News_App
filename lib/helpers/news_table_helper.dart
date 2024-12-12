import 'package:quiz_assigment/database/database.dart';
import 'package:drift/drift.dart' as drift;

final _database = AppDb();

class InsertNews {
  final int newsId;
  final String header;
  final String imageUrl;
  final String description;
  final String author;
  final String time;

  const InsertNews(
      {required this.newsId,
      required this.header,
      required this.imageUrl,
      required this.description,
      required this.author,
      required this.time});

  Future<void> addData() async {
    NewsItem? item = await _database.selectOneNews(newsId);
    if (item == null) {
      int result = await _database.addNews(
        NewsItemsCompanion(
          id: drift.Value(newsId),
          title: drift.Value(header),
          description: drift.Value(description),
          author: drift.Value(author),
          content: drift.Value(description),
          url: const drift.Value('www.testurl.com'),
          urlToImage: drift.Value(imageUrl),
        ),
      );

      print('Result :  $result');
      
    } else {

      print('Item already in the database! :- $item');
    }
  }
}
