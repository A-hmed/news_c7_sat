import 'package:flutter/material.dart';
import 'package:news_c7_sat/api/ApiManager.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/tabs_list.dart';

class Home extends StatelessWidget {
  static String routeName = "home";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("News App"),),
      body: FutureBuilder<TabsResponse>(
        future: ApiManager.getTabs(),
        builder: (_, snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else {
            return TabsList(snapShot.data!.tabs!);
          }
        },
      ),
    );
  }
}
