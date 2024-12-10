import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NewsCard extends StatefulWidget {
  const NewsCard(
      {super.key,
      required this.header,
      required this.description,
      required this.author,
      required this.time,
      required this.url});

  final String header;
  final String description;
  final String author;
  final Duration time;
  final String url;

  @override
  State<NewsCard> createState() {
    return _NewsCardState();
  }
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    String header = widget.header;
    String author = widget.author;
    String url = widget.url;
    Duration time = widget.time;
    String description = widget.description;

    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return const Text('Hello');
            },
          ),
        );
      },
      child: Card(
        color: const Color.fromARGB(255, 255, 254, 252),
        margin: const EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20,),
                child: Image.asset(
                  'assets/images/news.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    url,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    top: 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Satoshi'),
                      ),
                      ReadMoreText(
                          description,
                          colorClickableText: const Color.fromARGB(255, 11, 145, 255),
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          trimCollapsedText: '...Show more',
                          trimExpandedText: '...show less',
                          style: const TextStyle(
                              fontFamily: 'Satoshi',
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Text(author),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('${time.inHours}h'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
