import 'package:news_c7_sat/data/model/news_response.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';

abstract class RemoteDataSource {

  Future<TabsResponse> getTabs(String categoryId);

  Future<NewsResponse> getNews(String tabId);

}