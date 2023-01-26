import 'package:flutter/material.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/news_fragment_view_model.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/tabs_list.dart';

class NewsFragment extends StatefulWidget {
  String selectedCategoryId;
  NewsFragment(this.selectedCategoryId);

  @override
  State<NewsFragment> createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  NewsFragmentViewModel vm = NewsFragmentViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.selectedCategoryId = widget.selectedCategoryId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TabsResponse?>(
      future:  vm.getTabs(),
      builder: (_, snapShot){
        if(snapShot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if(snapShot.hasError || snapShot.data == null){
          return Text(snapShot.error.toString());
        }else {
          return TabsList(snapShot.data!.tabs!);
        }
      },
    );
  }
}
