import 'package:flutter/material.dart';
import 'package:rickandmorty/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RickAndMorty',
      home: HomePage(),
    );
  }
}
