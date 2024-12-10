import 'package:dio/dio.dart';
import 'package:quiz_assigment/models/news_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://newsapi.org/v2/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('everything')
  Future<List<NewsModel>> getNews();
}