import 'package:flutter/material.dart';
import 'package:test1/pages/menu.dart';
import 'package:test1/pages/test3.dart';
import 'package:test1/pages/test4.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MenusPage(),
        '/MyWidget': (context) => MyWidget(),
        '/Item': (context) => Item(),
      },
    );
  }
}
