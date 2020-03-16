import 'package:flutetr_du_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[BgMainPic(), BgOtherPic()],
        fit: StackFit.expand,
      ),
    );
  }
}

// 这个其实就是当前显示的，随时准备被替换掉，就像男女朋友一样
class BgMainPic extends StatelessWidget {
  const BgMainPic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Opacity(
      opacity: provider.mainPicOp,
      child: Image.asset(
        'lib/images/login_bg${provider.mainPicIndex}.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}

class BgOtherPic extends StatelessWidget {
  const BgOtherPic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginProvider provider = Provider.of<LoginProvider>(context);
    return Opacity(
      opacity: provider.otherPicOp,
      child: Image.asset(
        'lib/images/login_bg${provider.otherPicIndex}.jpeg',
        fit: BoxFit.cover,
      ),
    );
  }
}
