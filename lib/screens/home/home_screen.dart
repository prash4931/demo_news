import 'package:demo_news/screens/home/home_news_widget/home_news_list_widget.dart';
import 'package:demo_news/screens/home/widgets/dialogs/home_select_location_dialog.dart';
import 'package:demo_news/widgets/common/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../core/constants/color_constants.dart';
import '../../core/constants/textstyle_constants.dart';
import '../../models/news_article_model/news_article_model.dart';
import '../../providers/home/home_news_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeNewsProvider>(context, listen: false).init(
          countryCode: context.read<HomeNewsProvider>().defaultCountryCode);
    });
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (!context.read<HomeNewsProvider>().isNewsDataLoadingMore) {
        context.read<HomeNewsProvider>().isNewsDataLoadingMore = true;
        context.read<HomeNewsProvider>().getMovies(
            countryCode: context.read<HomeNewsProvider>().defaultCountryCode);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants().faintPrimaryColor,
      appBar: CommonAppBar(
        title: 'MyNews',
        isLeadingRequired: false,
        centerTitle: false,
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const HomeSelectLocationDialog();
                  },
                );
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.near_me,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    context
                        .read<HomeNewsProvider>()
                        .defaultCountryCode
                        .toUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
      body: Consumer<HomeNewsProvider>(
        builder: (context, state, child) {
          if (state.isNewsDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.newsArticlesList.isNotEmpty) {
            return homeScreenBody(
                newsArticlesList: state.newsArticlesList,
                controller: _controller);
          } else {
            return const Text('No News Available');
          }
        },
      ),
      bottomSheet: (context.watch<HomeNewsProvider>().isNewsDataLoadingMore)
          ? const Center(child: CircularProgressIndicator())
          : null,
    );
  }

  Widget homeScreenBody(
      {required List<NewsArticleModel?> newsArticlesList,
      required ScrollController controller}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Headlines',
            style: TextStyleConstants().itemHeadingTextStyle,
          ),
          Expanded(
            child: HomeNewsListWidget(
              newsArticlesList: newsArticlesList,
              controller: controller,
            ),
          )
        ],
      ),
    );
  }
}
