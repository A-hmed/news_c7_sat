import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_c7_sat/data/model/tabs_response.dart';

CollectionReference<TabsResponse> getTabsCollection(){
  return FirebaseFirestore.instance.collection("tabs").withConverter<TabsResponse>(
      fromFirestore: (snapshot, _) =>TabsResponse.fromJson(snapshot.data()!),
      toFirestore: (tabsResponse, _) => tabsResponse.toJson());
}

Future saveTabsResponseInFireStore(TabsResponse tabs, String categoryId){
  print("Ahmed Saving data to store ");

  return getTabsCollection().doc(categoryId).set(tabs);
}

Future<TabsResponse?> getTabsResponseFromfireStore(String categoryId) async{
 DocumentSnapshot<TabsResponse> doc = await getTabsCollection().doc(categoryId).get();
 print("Ahmed Getting data from store ${doc.data()}");
 return doc.data();
}