import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';



@JsonSerializable()
class NewsResponse{

  final String status;
  final int totalResults;
  final List<Articals>? articals;

   NewsResponse({ required this.status, required this.totalResults, this.articals });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
}



@freezed
class Articals with _$Articals
{

  const factory Articals({required Source source, required String author, required String title, required String description, required String url, required String urlToImage, required String publishedAt, required String content})= _Articals;

  factory Articals.fromJson(Map<String, dynamic> json) => _$ArticalsFromJson(json);
}


@freezed
class Source with _$Source
{
  const factory Source({required int id,required String name}) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}