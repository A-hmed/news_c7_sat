import 'package:flutter/material.dart';
import 'package:news_c7_sat/data/model/news_response.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/news_widget.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/news_fragment_view_model.dart';

class TabDetails extends StatefulWidget {
  MyTab tab;
  TabDetails(this.tab);

  @override
  State<TabDetails> createState() => _TabDetailsState();
}

class _TabDetailsState extends State<TabDetails> {
  NewsFragmentViewModel vm = NewsFragmentViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.tab = widget.tab;
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<NewsResponse>(
        future: vm.getNews(),
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
