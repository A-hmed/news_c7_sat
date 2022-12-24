import 'package:flutter/material.dart';
import 'package:news_c7_sat/model/tabs_response.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/tab_details.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/tab_widget.dart';

class TabsList extends StatefulWidget {
  List<MyTab> tabs;
  TabsList(this.tabs);

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: widget.tabs.length,
        child: Column(
          children: [
            TabBar(
              onTap:(index){
                currentIndex = index;
                setState((){});
              } ,
              indicatorColor: Colors.transparent,
              isScrollable: true ,
                tabs: widget.tabs.map((tab) {
                  return TabWidget(tab, currentIndex == widget.tabs.indexOf(tab));
                }).toList()
            ),
            Expanded(
              child: TabBarView(
                  children: widget.tabs.map((tab){
                   return TabDetails(tab);
                  }).toList()
              ),
            )
          ],
        )
    );
  }
}
