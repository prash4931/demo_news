import 'package:demo_news/widgets/common/common_inapp_webview.dart';
import 'package:flutter/material.dart';

import '../../../models/news_article_model/news_article_model.dart';

class HomeNewsListItemWidget extends StatelessWidget {
  final NewsArticleModel newsListItem;
  const HomeNewsListItemWidget({super.key, required this.newsListItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          if (newsListItem.url != null && newsListItem.url!.isNotEmpty) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return CommonInAppWebView(
                  url: newsListItem.url!,
                  title: newsListItem.title ?? '',
                );
              },
            ));
          }
        },
        child: Card(
          color: newsListItem.url != null && newsListItem.url!.isNotEmpty
              ? Colors.amberAccent
              : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newsListItem.source?.name ?? 'News Source Unavailable',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsListItem.description ?? newsListItem.title ?? 'NA',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // '10 min ago',
                        '${newsListItem.publishedAt ?? 'NA'}',
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        newsListItem.urlToImage ??
                            'https://play-lh.googleusercontent.com/OABfRfKxyvf6PUg_6YBJXvbKSbegFsBKvFDEm5jOA0rC5k1la-OwmnWz6GK55vr3EGA',
                        height: 100,
                        width: 100,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
