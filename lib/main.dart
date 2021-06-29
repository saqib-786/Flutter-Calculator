import 'package:calculator/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Calculator',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),),
        body: Calculator(),
      ),
    );
  }
}
