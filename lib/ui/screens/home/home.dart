import 'package:flutter/material.dart';
import 'package:news_c7_sat/data/model/category_dm.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/categories/categories_fragment.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/news_fragment.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/newsfragment/tabs_list.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/settings/settings_fragment.dart';


class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedFragment;
  CategoryDM? selectedCategory = null;

  onCategoriesClicked(CategoryDM newSelectedCategory){
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFragment = CategoriesFragment(onCategoriesClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"), centerTitle: true,
      toolbarHeight: 70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * .8,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .2,
              color: Colors.blue,
              child: Center(child: Text("News app!", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                selectedFragment = CategoriesFragment(onCategoriesClicked);
                selectedCategory = null;
                Navigator.pop(context);
                setState(() {});
              },
              child: Row(
                children: const [
                  SizedBox(width: 8,),
                  Icon(Icons.menu, size: 40, color: Colors.black,),
                  SizedBox(width: 4,),
                  Text("Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),)
                ],
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                selectedFragment = SettingsFragment();
                selectedCategory = null;
                Navigator.pop(context);
                setState(() {});
              },
              child: Row(
                children: const [
                  SizedBox(width: 8,),
                  Icon(Icons.settings, size: 40, color: Colors.black,),
                  SizedBox(width: 4,),
                  Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),)
                ],
              ),
            )
          ],
        ),
      ),
      body:selectedCategory == null?  selectedFragment:
      NewsFragment(selectedCategory!.id),
    );
  }
}
