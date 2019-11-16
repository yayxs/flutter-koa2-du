import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '首页',
          style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(36)),
        ),
      ),
      body: Container(
        height: ScreenUtil.getInstance().setHeight(1334),
        width: ScreenUtil.getInstance().setWidth(750),
        child: Image.network(
          'https://i.demo-1s.com/2019/11/16/yjhPSQWjuqPmosIL.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
