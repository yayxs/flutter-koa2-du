import 'dart:async';

/// 闪屏的页面
import 'package:flutter/material.dart';
import '../utils/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  /// 设计一个计时器，用来等计时器结束的时候，跳转
  jumpPage() {
    return Timer(Duration(milliseconds: 3000), () {
      Navigator.pushReplacementNamed(context, 'guidePages');
    });
  }

  @override
  void initState() {
    super.initState();

    jumpPage();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
        backgroundColor: Colors.white, // 背景色
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/splash_screen.jpg'),
                  fit: BoxFit.cover)), // 添加背景图片
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                      ),
                      Text('欢迎来到孤岛',
                          style: TextStyle(
                              fontSize: fontSize40,
                              color: Colors.white10,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: height100,
                      ),
                      Text('By 洋小洋',
                          style: TextStyle(
                              fontSize: fontSize40,
                              color: Colors.white10,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  // 线性渐变 有个渐变的过程
                  Color.fromRGBO(0, 0, 0, 0.2),
                  Color.fromRGBO(0, 0, 0, 0.5)
                ],
                    begin: FractionalOffset.topCenter, // 顶部居中
                    end: FractionalOffset.bottomCenter)), // 底部居中
          ),
        ));
  }
}
