import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/widget_search_bar.dart';
import '../utils/my_http.dart';

class BookListPage extends StatefulWidget {
  BookListPage({Key key}) : super(key: key);

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    getHttp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '书单',
          style: TextStyle(fontSize: ScreenUtil.getInstance().setSp(36)),
        ),
      ),
      body: Container(
        child: WidgetSearchBar(),
      ),
    );
  }
}
