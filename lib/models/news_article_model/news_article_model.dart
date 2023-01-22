import 'package:json_annotation/json_annotation.dart';

import '../news_article_source_model/news_article_source_model.dart';

part 'news_article_model.g.dart';

@JsonSerializable()
class NewsArticleModel {
  @JsonKey(name: 'source')
  final NewsArticleSourceModel? source;
  @JsonKey(name: 'author')
  final String? author;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'urlToImage')
  final String? urlToImage;
  @JsonKey(name: 'publishedAt')
  final DateTime? publishedAt;
  @JsonKey(name: 'content')
  final String? content;

  NewsArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);
}
