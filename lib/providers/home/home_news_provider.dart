import 'package:demo_news/repository/news_repository/i_news_repository.dart';
import 'package:demo_news/repository/news_repository/news_repository.dart';
import 'package:flutter/material.dart';

import '../../models/news_article_model/news_article_model.dart';

class HomeNewsProvider extends ChangeNotifier {
  INewsRepository repository = NewsRepository();

  List<NewsArticleModel?> newsArticlesList = [];

  bool isNewsDataLoading = false;

  init({required String countryCode}) {
    clearData();
    getMovies(countryCode: countryCode);
  }

  List<String> locationsList = [
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];

  clearData() {
    isNewsDataLoading = true;
    newsArticlesList.clear();
    notifyListeners();
  }

  Future<void> getMovies({required String countryCode}) async {
    final response = await repository.getNews(countryCode: countryCode);

    if (response?.articles != null) {
      newsArticlesList.addAll(response!.articles!);
      notifyListeners();
    }
    isNewsDataLoading = false;
    notifyListeners();
  }
}
