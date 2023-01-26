import 'package:flutter/material.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';

class TabWidget extends StatelessWidget {
  MyTab tab;
  bool isSelected;
  TabWidget(this.tab, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? Colors.blue : Colors.transparent,
      ),
      child: Text(tab.name??"", style: TextStyle(fontSize: 20,
          color: isSelected? Colors.white: Colors.blue),),
    );
  }
}
