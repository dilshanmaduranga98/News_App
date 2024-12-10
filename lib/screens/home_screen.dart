import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:quiz_assigment/models/news_model.dart';
import 'package:quiz_assigment/screens/news_details_screen.dart';
import 'package:quiz_assigment/screens/setting_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:remixicon/remixicon.dart';

final String? apikey = dotenv.env['API_KEY'];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //Future<List<Articals>> 
  void getHttp(String? apiKey) async {
    await dotenv.load(fileName: ".env");

    try{
      final response = await Dio()
        .get('https://newsapi.org/v2/everything?q=apple&apiKey=$apiKey');

        //print('Response Data : ${response.data}');
    
      final List<dynamic> newResponse = response.data['articles'];

     // final articals = newResponse.map((item) => Articals(author: item.author, content: item.content, description: item.description, ));
      print('News : ${newResponse}');

      //return articals;

    }catch (e)
    {
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
          IconButton(
            onPressed: () {
              getHttp(apikey);
            },
            icon: const Icon(Remix.download_2_line),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 20,
          ),
          child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) {
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
                                header:
                                    'Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC $index',
                                description: description,
                                imageUrl: imageUrl,
                                author: author,
                                time: time,
                              );
                            },
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Text(
                            'Text $index',
                            style: const TextStyle(fontSize: 30),
                          ),
                          const ReadMoreText(
                              'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is ',
                              colorClickableText:
                                  Color.fromARGB(255, 11, 145, 255),
                              trimMode: TrimMode.Line,
                              trimLines: 5,
                              trimCollapsedText: '...Show more',
                              trimExpandedText: '...show less',
                              style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold)),
                          Text(author),
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
