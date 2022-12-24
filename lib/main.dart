import 'package:flutter/material.dart';
import 'package:news_c7_sat/ui/screens/home/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Home.routeName: (_)=> Home()
      },
      initialRoute: Home.routeName,
    );
  }
}
