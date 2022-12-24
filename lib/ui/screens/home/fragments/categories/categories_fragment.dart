import 'package:flutter/material.dart';
import 'package:news_c7_sat/model/category_dm.dart';
import 'package:news_c7_sat/ui/screens/home/fragments/categories/category.dart';
class CategoriesFragment extends StatelessWidget {

  Function onCategoryClicked;

  CategoriesFragment(this.onCategoryClicked);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Pick your category of intereset", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: GridView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index){
                  return InkWell(
                      onTap: (){
                        onCategoryClicked(CategoryDM.categories[index]);
                      },
                      child: Category(CategoryDM.categories[index]));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   crossAxisSpacing: 18,
                   mainAxisSpacing: 18
                  )
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}
