import 'package:flutter/material.dart';

import '../../../models/news_article_model/news_article_model.dart';
import 'home_news_list_item_widget.dart';

class HomeNewsListWidget extends StatelessWidget {
  final List<NewsArticleModel?> newsArticlesList;
  final ScrollController controller;
  const HomeNewsListWidget(
      {super.key, required this.newsArticlesList, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: newsArticlesList.length,
      itemBuilder: (context, index) {
        final newsListItem = newsArticlesList[index];
        if (newsListItem != null) {
          return HomeNewsListItemWidget(newsListItem: newsListItem);
        }

        return const SizedBox();
      },
    );
  }
}
