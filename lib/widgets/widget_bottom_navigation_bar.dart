/// Author yayxs
/// Desc 底部导航
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../pages/home_page.dart';
import '../pages/book_list_page.dart';
import '../pages/love_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/global.dart';

/// 在这里我们生命一个有状态的部件，因为其中会牵扯到index的改变
class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({Key key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget>
    with SingleTickerProviderStateMixin {
  /// 这里声明一个控制器，在flutter中好多用到控制器的地方，包括像最常见的表单
  TabController tabController;

  /// 这里把我们引入的三个页面放进List集合里，等候发落
  List _pages = [HomePage(), BookListPage(), LovePage()];

  /// 这个就是比较核心的索引了，默认值就是我们的首页
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        /// setState 这里有点像咱们 的React，更改数据的时候是要在setState()里
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  // 这里是一个部件，返回的值类型是个Widget是用Scaffold包着的，里边也是界面的核心
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // backgroundColor: _pages[currentIndex],
          index: currentIndex,
          // 底部按钮
          items: <Widget>[
            Image.asset(
              'images/bottom_nav/home@light.png',
              width: width100,
              height: height100,
            ),
            Image.asset('images/bottom_nav/book_list@light.png',
                width: width100, height: height100),
            Image.asset('images/bottom_nav/love@light.png',
                width: width100, height: height100),
          ],

          /// 点击不同的底部导航
          onTap: (index) {
            //Handle button tap
            setState(() {
              currentIndex = index;
            });
            tabController.animateTo(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
        // 主体部分，就是文中我们所说的人的身体一样
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              child: _pages[0],
            ),
            Container(
              child: _pages[1],
            ),
            Container(
              child: _pages[2],
            )
          ],
        ));
  }
}
