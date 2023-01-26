import 'package:news_c7_sat/data/model/tabs_response.dart';

abstract class LocalDataSource{

  Future<TabsResponse?> getTabs(String categoryId);

  saveTabs(TabsResponse response, String categoryId);
}