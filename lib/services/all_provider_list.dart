import 'package:demo_news/providers/home/home_news_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> allproviderList() {
  return [ChangeNotifierProvider(create: (_) => HomeNewsProvider())];
}
