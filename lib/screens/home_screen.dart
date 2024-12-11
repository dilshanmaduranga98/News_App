import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quiz_assigment/models/news_model.dart';
import 'package:quiz_assigment/screens/news_details_screen.dart';
import 'package:quiz_assigment/screens/setting_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:remixicon/remixicon.dart';

final String? newsapikey = dotenv.env['API_KEY'];

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //Future<List<Articals>>
  Future<List<Articals>> getHttp(String? apikey) async {
    print(apikey);
    try {
      final response = await Dio()
          .get('https://newsapi.org/v2/everything?q=apple&apiKey=${apikey}');

      //print('Response Data : ${response.data}');

      final List<dynamic> newResponse = response.data['articles'];

      final articals =
          newResponse.map((item) => Articals.fromJson(item)).toList();
      print('News : $articals');

      return articals;
    } catch (e) {
      print('Error fetching news: $e');
      rethrow;
    }
  }

  //final String header = ;
  final String description =
      'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is';
  final String author = 'jhon doe';
  final String imageUrl =
      'https://img.freepik.com/free-vector/storm-concept-illustration_114360-6905.jpg?t=st=1733462498~exp=1733466098~hmac=08e1e1752a87cee5e835a84a874a47d1fb1c65c5ddf456a958abdda6b1988cfa&w=740';
  final Duration time = const Duration(hours: 5);

  Future<List<Articals>>? articalsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News Feed',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const SettingScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          child: FutureBuilder<List<Articals>>(
            future: getHttp(newsapikey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                List<Articals> articals = snapshot.data!;

                return ListView.builder(
                  itemCount: articals.length,
                  itemBuilder: (context, index) {
                    Articals artical = articals[index];

                    return ListTile(
                      title: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return NewsDetailsScreen(
                                      newsId: index,
                                      header: artical.title ?? 'null',
                                      description: artical.content ?? 'null',
                                      imageUrl:
                                          '${artical.urlToImage ?? 'https://via.placeholder.com/300x200.png?text=No+Image'}',
                                      author: artical.author ?? 'null',
                                      time: artical.publishedAt ?? 'null',
                                    );
                                  },
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Hero(
                                    tag: index,
                                    child: Image.network(
                                      artical.urlToImage ??
                                          'https://via.placeholder.com/150x150.png?text=No+Image',
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  artical.title ?? 'null',
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  artical.publishedAt ?? 'no date',
                                  style: const TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 10,
                                      color:
                                          Color.fromARGB(255, 107, 107, 107)),
                                  textAlign: TextAlign.left,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                ReadMoreText(
                                  artical.description ?? 'null',
                                  colorClickableText:
                                      const Color.fromARGB(255, 11, 145, 255),
                                  trimMode: TrimMode.Line,
                                  trimLines: 5,
                                  trimCollapsedText: '...Show more',
                                  trimExpandedText: '...show less',
                                  style: const TextStyle(
                                      fontFamily: 'Satoshi',
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '-  ${artical.author ?? 'null'}  -',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                    color: Color.fromARGB(255, 107, 107, 107),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  // separatorBuilder: (context, index){
                  //    return Divider();
                  // },
                );
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: [
        //     // NewsCard(
        //     //   header: 'Lorem ipsum dolor sit amet',
        //     //   description:
        //     //       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore, Sed do eiusmod tempor incididunt ut labore, Sed do eiusmod tempor incididunt ut labore',
        //     //   author: 'Jhon doe',
        //     //   time: const Duration(hours: 5),
        //     //   url: 'www.urllink.com',
        //     // ),
        //   ],
        // ),
        //),
      ),
    );
  }
}
