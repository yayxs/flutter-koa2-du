import 'dart:async';

import 'package:flutter/material.dart';

class LoginProvider extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  Animation<double> bgAnimation; // 背景动画
  AnimationController bgController; // 动画控制器

  double mainPicOp = 1.0; // 当前正在显示的透明度是1
  double otherPicOp = 0.0; // 备胎是0 随时准备上位

  int mainPicIndex = 0; // 当前正在显示的图片编号
  int otherPicIndex = 1; // 备胎是1

  List<String> imgsList; // 图片列表

  Timer dingShiQi; // 定时器

  LoginProvider() {
    imgsList = List<String>(); // 初始化
    imgsList.add('lib/images/login_bg1.jpeg');
    imgsList.add('lib/images/login_bg2.jpeg');
    imgsList.add('lib/images/login_bg3.jpeg');
    imgsList.add('lib/images/login_bg4.jpeg');

    bgController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 666));
    bgAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(bgController)
      ..addListener(() {
        // print(bgAnimation.value);
        mainPicOp = 1.0 - bgAnimation.value;
        otherPicOp =  bgAnimation.value;
        notifyListeners();
      })
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          mainPicIndex = mainPicIndex + 1;
          otherPicIndex = otherPicIndex + 1;
          if (mainPicIndex == imgsList.length) {
            mainPicIndex = 0;
          }
          if (otherPicIndex == imgsList.length) {
            otherPicIndex = 0;
          }

          mainPicOp = 1.0;
          otherPicOp = 0.0;
          notifyListeners();
        }
      });

    dingShiQi = Timer.periodic(Duration(seconds: 2), (cb) {
      bgController.forward(from: 0);
    });
  }

  @override
  void dispose() {
    dingShiQi.cancel();
    bgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }
}
