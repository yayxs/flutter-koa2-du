import 'package:flutetr_du_app/pages/login/login_page.dart';
import 'package:flutetr_du_app/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Consumer<LoginProvider>(
        builder: (context, counter, _) {
          return MaterialApp(home: LoginPage());
        },
      ),
    );
  }
}
