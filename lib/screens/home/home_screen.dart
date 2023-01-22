import 'package:demo_news/screens/home/widgets/dialogs/home_select_location_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../models/news_article_model/news_article_model.dart';
import '../../providers/home/home_news_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeNewsProvider>(context, listen: false)
          .init(countryCode: 'IN');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: null,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text('MyNews'),
        actions: [
          TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const HomeSelectLocationDialog();
                  },
                );
              },
              child: Row(
                children: const [Icon(Icons.near_me), Text('IN')],
              ))
        ],
      ),
      body: Consumer<HomeNewsProvider>(
        builder: (context, state, child) {
          if (state.isNewsDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.newsArticlesList.isNotEmpty) {
            return homeScreenBody(newsArticlesList: state.newsArticlesList);
          } else {
            return const Text('No News Available');
          }
        },
      ),
    );
  }

  Widget homeScreenBody({required List<NewsArticleModel?> newsArticlesList}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Headlines',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: newsArticlesList.length,
              itemBuilder: (context, index) {
                final newsListItem = newsArticlesList[index];
                if (newsListItem != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
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
                                    newsListItem.source?.name ??
                                        'News Source Unavailable',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    newsListItem.description ?? 'NA',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    // '10 min ago',
                                    '${newsListItem.publishedAt ?? 'NA'}',
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 10),
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
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
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
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
