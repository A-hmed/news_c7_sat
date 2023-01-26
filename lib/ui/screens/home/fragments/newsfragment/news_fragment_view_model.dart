

import 'package:news_c7_sat/data/api/ApiManager.dart';
import 'package:news_c7_sat/data/model/news_response.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/data/repos/data_sources/local_data_source/local_data_source_impl.dart';

import 'package:news_c7_sat/data/repos/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:news_c7_sat/data/repos/news_repo_impl.dart';
import 'package:news_c7_sat/data/repos/news_repository.dart';

class NewsFragmentViewModel {
  late MyTab tab;
  late String selectedCategoryId;
  late NewsRepository repo = NewsRepositoryImpl(
    RemoteDataSourceImpl(),
    LocalDataSourceImpl(),
    false
  );


  Future<NewsResponse> getNews(){
     return repo.getNews(tab.id??"");
   }

  Future<TabsResponse?> getTabs(){
    return  repo.getTabs(selectedCategoryId);
  }

}