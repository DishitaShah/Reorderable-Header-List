import 'package:flutter/material.dart';
import 'package:flutter_reorderableheaderlist/reorderablelist_with_header.dart';
import 'package:flutter_reorderableheaderlist/food_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Reorderable Header ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FoodLists(),
    );
  }
}


