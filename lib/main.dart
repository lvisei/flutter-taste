import 'package:flutter/material.dart';
import 'package:flutter_demo_app/layouts/main_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue, // 主色，决定导航栏颜色
          accentColor: Colors.grey[50], //次级色，决定大多数Widget的颜色，如进度条、开关等
          backgroundColor: Color(0xFFFFFFFF),
//          primaryColor: Color(0xFFFFFFFF), //主题颜色样本
        ),
        home: MainNavigation(),
        onGenerateRoute: null);
  }
}
