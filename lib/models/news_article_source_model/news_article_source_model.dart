import 'package:json_annotation/json_annotation.dart';

part 'news_article_source_model.g.dart';

@JsonSerializable()
class NewsArticleSourceModel {
  @JsonKey(name: 'id')
  final dynamic id;
  @JsonKey(name: 'name')
  final String? name;

  NewsArticleSourceModel({this.id, this.name});

  factory NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleSourceModelToJson(this);
}
