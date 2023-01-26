import 'package:news_c7_sat/data/api/ApiManager.dart';
import 'package:news_c7_sat/data/model/news_response.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/data/repos/data_sources/remote_data_source/remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {

  @override
  Future<NewsResponse> getNews(String tabId) {
    return ApiManager.getNews(tabId);
  }

  @override
  Future<TabsResponse> getTabs(String categoryId) {
    return ApiManager.getTabs(categoryId);
  }
}