import 'package:flutter/material.dart';
import 'package:uas_pmobile/view/home.dart';
import 'package:uas_pmobile/view/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDN NEWS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Home(), //panggil class di login_page.dart
    );
  }
}
