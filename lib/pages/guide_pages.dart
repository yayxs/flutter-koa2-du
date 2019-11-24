import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:lsolated_island_app/utils/global.dart';

class GuidePages extends StatelessWidget {
  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        iconColor: Colors.pink,
        bubbleBackgroundColor: Colors.pink,
        // bubble: Image.asset('images/jiche.jpg'),
        body: Text(
          '这是属于你我的孤岛',
        ),
        title: Text(
          'No.1',
        ),
        // titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        // bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
          child: Image.asset(
            // 图片
            'images/jiche.jpg',
            height: width750,
            width: height1314,
            fit: BoxFit.cover,
            // alignment: Alignment.center, // 居中显示
          ),
        )),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconColor: Colors.greenAccent,
      bubbleBackgroundColor: Colors.greenAccent,
      // iconImageAssetPath: 'images/miaosu.jpg',
      body: Text(
        '无问世间',
      ),
      title: Text('No.2'),
      mainImage: Image.asset(
        'images/miaosu.jpg',
        height: height1314,
        width: width750,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      iconColor: Colors.purple,
      bubbleBackgroundColor: Colors.purple,
      pageColor: const Color(0xFF607D8B),
      // iconImageAssetPath: 'images/nidename.jpg',
      body: Text(
        '下回见',
      ),
      title: Text('No.3'),
      mainImage: Image.asset(
        'images/nidename.jpg',
        height: height1314,
        width: width750,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.white,
      skipText: Text('跳过'),
      doneText: Text('完成'),
      // showNextButton: true,
      // showBackButton: true,
      onTapDoneButton: () {
        Navigator.pushReplacementNamed(context, 'widgetBottomNavigationBar');
      },
      pageButtonTextStyles: TextStyle(
        color: Colors.white,
        fontSize: fontSize40,
      ),
      //IntroViewsFlutter
    );
  }
}
