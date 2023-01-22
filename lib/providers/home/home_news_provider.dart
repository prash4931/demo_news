import 'package:demo_news/repository/news_repository/i_news_repository.dart';
import 'package:demo_news/repository/news_repository/news_repository.dart';
import 'package:flutter/material.dart';

import '../../models/news_article_model/news_article_model.dart';

class HomeNewsProvider extends ChangeNotifier {
  INewsRepository repository = NewsRepository();

  List<NewsArticleModel?> newsArticlesList = [];

  bool isNewsDataLoading = false;

  final int pageSize = 20;
  int page = 1;

  int tempPageSize = 0;

  bool isNewsDataLoadingMore = false;

  String defaultCountryCode = 'in';

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
    page = 1;
    tempPageSize = pageSize;
    notifyListeners();
  }

  onCountryCodeChanged(String value) {
    defaultCountryCode = value;
    init(countryCode: value);
    notifyListeners();
  }

  Future<void> getMovies({required String countryCode}) async {
    final response = await repository.getNews(
        countryCode: countryCode, page: page, pageSize: pageSize);

    if (response?.articles != null) {
      page++;
      newsArticlesList.addAll(response!.articles!);
      notifyListeners();
    }
    isNewsDataLoading = false;
    isNewsDataLoadingMore = false;
    notifyListeners();
  }
}
