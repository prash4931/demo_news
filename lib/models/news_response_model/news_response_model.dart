import 'package:json_annotation/json_annotation.dart';

import '../news_article_model/news_article_model.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsResponseModel {
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'totalResults')
  final int? totalResults;
  @JsonKey(name: 'articles')
  final List<NewsArticleModel?>? articles;

  NewsResponseModel({this.status, this.totalResults, this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResponseModelToJson(this);
}
