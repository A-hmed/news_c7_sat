import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/data/repos/data_sources/local_data_source/local_data_source.dart';
import 'package:news_c7_sat/data/firbase/firestore_helper.dart';

class LocalDataSourceImpl implements LocalDataSource {

  @override
  Future<TabsResponse?> getTabs(String categoryId) {
      return getTabsResponseFromfireStore(categoryId);
  }

  @override
  Future saveTabs(TabsResponse response, String categoryId) async {
     await saveTabsResponseInFireStore(response, categoryId);
  }

}