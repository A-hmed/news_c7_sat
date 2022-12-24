import 'package:flutter/material.dart';
import 'package:news_c7_sat/api/ApiManager.dart';
import 'package:news_c7_sat/model/news_response.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/news_widget.dart';

class TabDetails extends StatelessWidget {
  MyTab tab;
  int page;
  TabDetails(this.tab);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(tab.id??""),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }else if(snapshot.hasData) {
             return ListView.builder(
                 itemCount: snapshot.data!.articles!.length,
                 itemBuilder: (context, index){
                   return NewsWidget(snapshot.data!.articles![index]);
                 });
          }else {
            return Center(child: CircularProgressIndicator());
          }
        }
        );
  }
}
