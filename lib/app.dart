import 'package:flutter/material.dart';
import 'package:rickandmorty/pages/detail_page.dart';
import 'package:rickandmorty/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RickAndMorty',
      routes: {
        DetailPage.routeName: (context) => DetailPage(),
      },
      home: HomePage(),
    );
  }
}
