import 'dart:convert';
import 'dart:developer';

import 'package:demo_news/core/core_http.dart';
import 'package:demo_news/models/news_response_model/news_response_model.dart';
import 'package:demo_news/repository/news_repository/i_news_repository.dart';

class NewsRepository extends INewsRepository {
  @override
  Future<NewsResponseModel?> getNews({required String countryCode}) async {
    try {
      const url =
          'https://newsapi.org/v2/top-headlines?country=in&apiKey=535b8d8372a24ec0afe843ea4af27234';

      final response = await getHttp(url: url);

      log('getNews\nurl: $url\nresponse: ${response.body}');

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        final res = NewsResponseModel.fromJson(result);

        return res;
      } else {
        return null;
      }
    } catch (e) {
      log('getNews API Error: $e');
      return null;
    }
  }
}
