import 'package:flutter/material.dart';

class WidgetLike extends StatefulWidget {
  WidgetLike({Key key}) : super(key: key);

  @override
  _WidgetLikeState createState() => _WidgetLikeState();
}

class _WidgetLikeState extends State<WidgetLike> with TickerProviderStateMixin {
  AnimationController _animationController; //
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(microseconds: 1000), // 持续的时长
      vsync: this, // 每一帧的反应 一秒60 this 当前对象
    );

    // 监听
    _animationController.addListener(() {});
    // 开始播放
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('sas'),
    );
  }
}
