import 'package:flutter/material.dart';
import 'package:news_c7_sat/api/ApiManager.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/tabs_list.dart';

class NewsFragment extends StatelessWidget {
  String selectedCategoryId;
  NewsFragment(this.selectedCategoryId);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TabsResponse>(
      future: ApiManager.getTabs(selectedCategoryId),
      builder: (_, snapShot){
        if(snapShot.hasError){
          return Text(snapShot.error.toString());
        }else if(snapShot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else {
          return TabsList(snapShot.data!.tabs!);
        }
      },
    );
  }
}
