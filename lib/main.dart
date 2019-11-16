import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './widgets/widget_bottom_navigation_bar.dart';

void main() => runApp(MyApp());

// 这里我们用StatelessWidget，我是一个没有状态的"孩子"
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '孤岛',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavBarWidget());
  }
}
