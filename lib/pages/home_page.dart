import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsolated_island_app/utils/global.dart';

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
          child: Center(
        child: Text(
          '这是一段测试文字,用来测试公共的字体大小变量',
          style: TextStyle(fontSize: fontSize24),
        ),
      )),
    );
  }
}
