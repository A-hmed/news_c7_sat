import 'package:connectivity/connectivity.dart';
import 'package:news_c7_sat/data/model/news_response.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/data/repos/data_sources/local_data_source/local_data_source.dart';
import 'package:news_c7_sat/data/repos/data_sources/remote_data_source/remote_data_source.dart';
import 'package:news_c7_sat/data/repos/news_repository.dart';

class NewsRepositoryImpl  implements NewsRepository{
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;
  bool isConnected;

  NewsRepositoryImpl(this.remoteDataSource, this.localDataSource, this.isConnected);

  @override
  Future<NewsResponse> getNews(String tabId) {
       return remoteDataSource.getNews(tabId);
  }

  @override
  Future<TabsResponse?> getTabs(String categoryId) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print("calling remote data soruce");
      var response = await remoteDataSource.getTabs(categoryId);
      if(response.tabs != null && response.tabs!.isNotEmpty){
        localDataSource.saveTabs(response, categoryId);
      }
      return response;
    } else {
      return localDataSource.getTabs(categoryId);
    }
}
}