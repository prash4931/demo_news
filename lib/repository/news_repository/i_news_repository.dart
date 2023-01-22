import '../../models/news_response_model/news_response_model.dart';

abstract class INewsRepository {
  Future<NewsResponseModel?> getNews(
      {required String countryCode, required int pageSize, required int page});
}
