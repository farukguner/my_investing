import 'package:flutter/material.dart';
import 'package:my_investing/Views/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: "/",
    routes: {
      "/": (context) => HomePage(
            title: 'Yatırımım',
          ),
      /*"/HomePage": (context) => HomePage(
            title: 'İlk Sayfa',
          ),
      "/ScaffoldDeneme": (context) => StatefulTest(),
      "/FirstTry": (context) => FirstTry(),
      "/TextFieldAndAlertView": (context) => TextFieldAndAlertView(),
      "/JSONDeneme": (context) => JSONDeneme(),
      "/JsonAssets": (context) => JsonAssets(),
      "/BasitHttp": (context) => BasitHttp(),
      "/JsonListTest": (context) => JsonListTest(),*/
    },
  ));
}

/* 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yatırımım',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Yatırımım'),
    );
  }
}
*/
