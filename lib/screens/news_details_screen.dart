import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_assigment/helpers/news_table_helper.dart';
import 'package:quiz_assigment/providers/download_provider.dart';
import 'package:remixicon/remixicon.dart';

class NewsDetailsScreen extends ConsumerWidget {
  final int newsId;
  final String header;
  final String imageUrl;
  final String description;
  final String author;
  final Duration time;

   const NewsDetailsScreen({super.key,required this.newsId, required this.header, required this.imageUrl, required this.description, required this.author, required this.time});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     
    final isSaveNews = ref.watch(saveNewsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: const Icon(
            Remix.arrow_left_s_line,
            size: 30,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            padding: const EdgeInsets.only(
              bottom: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  header,
                  style:const TextStyle(
                      fontSize: 26,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${time.inHours}h ago'),
                    IconButton(
                      onPressed: () {
                        ref.read(saveNewsProvider.notifier).toggle();
                        InsertNews(newsId: newsId,header: header, description: description,author: author, imageUrl: imageUrl, time: time).addData();
                        const SnackBar(content: Text("hello"));
                      },
                      icon: isSaveNews
                          ? const Icon(Remix.bookmark_3_fill)
                          : const Icon(Remix.bookmark_3_line),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(imageUrl)),
                const SizedBox(
                  height: 30,
                ),
                 Text(
                  description,
                  style:const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Satoshi',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Text(
                  author,
                  style:const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Satoshi',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
