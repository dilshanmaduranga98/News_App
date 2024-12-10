import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@freezed
class OutPutNews with _$OutPutNews{
  const factory OutPutNews({ required String status, required int totalResults, required List<Articals> articals }) = _OutPutNews;

  factory OutPutNews.fromJson(Map<String, Object?> json) => _$OutPutFromJson(json);
}


@JsonSerializable()
class NewsModel {

  final String status;
  final int totalResults;
  final List<Articals> articals;

  const NewsModel({required this.status, required this.totalResults, required this.articals});


}

class Articals 
{
  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  const Articals({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content});
}

class Source
{
  final int id;
  final String name;

  const Source({required this.id,required this.name});
}