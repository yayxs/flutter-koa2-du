import 'package:flutter/material.dart';
import 'package:lsolated_island_app/utils/global.dart';

class WidgetLike extends StatefulWidget {
  WidgetLike({Key key}) : super(key: key);

  @override
  _WidgetLikeState createState() => _WidgetLikeState();
}

class _WidgetLikeState extends State<WidgetLike> with TickerProviderStateMixin {
  AnimationController _animationController; // 动画控制器
  Animation _animationSize; // 大小
  Animation _animationColor; // 颜色
  CurvedAnimation _curvedAnimation;

  // 初始化
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      // value: 20.0, //
      // lowerBound: 20.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000), // 持续的时长
      vsync: this, // 每一帧的反应 一秒60 this 当前对象
    );

    _animationSize =
        Tween(begin: 30.0, end: 100.0).animate(_animationController);

    // // 监听
    _animationController.addListener(() {
      // print('${_animationController.value}');
      setState(() {});
    });
    // 开始播放动画
    // _animationController.forward();
    // // 设置动画的范围

    _animationColor = ColorTween(begin: Colors.red, end: Colors.red[900])
        .animate(_animationController);

    _curvedAnimation = CurvedAnimation(
        parent: _animationController, curve: Curves.bounceOut); // 动画曲线

    // // 监听状态
    _animationController.addStatusListener((AnimationStatus status) {});
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          child: Text('${_animationController.value}'),
        ),
        Container(
          child: IconButton(
            iconSize: _animationSize.value,
            color: _animationColor.value,
            onPressed: () {
              print('点击了');
              // _animationController.forward();

              switch (_animationController.status) {
                case AnimationStatus.completed:
                  _animationController.reverse();
                  break;
                default:
                  _animationController.forward();
              }
            },
            icon: Icon(Icons.favorite),
          ),
        )
      ],
    ));
  }
}
