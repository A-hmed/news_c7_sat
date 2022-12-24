import 'package:flutter/material.dart';
import 'package:news_c7_sat/api/ApiManager.dart';
import 'package:news_c7_sat/model/news_response.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/news_widget.dart';

class TabDetails extends StatelessWidget {
  MyTab tab;
  TabDetails(this.tab);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNews(tab.id??""),
      builder: (context, snapShot){
        if(snapShot.hasError){
          return Text(snapShot.error.toString());
        }else if(snapShot.hasData){
          return ListView.builder(
              itemCount: snapShot.data!.articles!.length,
              itemBuilder: (context, index){
                return NewsWidget(snapShot.data!.articles![index]);
              });
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
