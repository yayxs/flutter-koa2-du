import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lsolated_island_app/utils/global.dart';
import '../widgets/widget_like.dart';

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
            '流行',
            style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(36)),
          ),
        ),
        body: SingleChildScrollView(
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Container(
                child: _like(),
              )
            ],
          ),
        ));
  }

  // 点赞 第一行
  Widget _like() => Container(
        child: Row(
          children: <Widget>[
            Container(
              width: width750,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.red)),
              child: WidgetLike(),
            )
          ],
        ),
      );
}
