import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LovePage extends StatefulWidget {
  LovePage({Key key}) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ctrl+s 保存就能更新视图',
          style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(36)),
        ),
      ),
      body: Container(
        height: ScreenUtil.getInstance().setHeight(1334),
        width: ScreenUtil.getInstance().setWidth(750),
        child: Image.network(
          'https://i.demo-1s.com/2019/11/16/l9TEuTeshmSQHgxy.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
