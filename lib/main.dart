import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/layouts/main_navigation.dart';
import 'package:flutter_demo/utils/request.dart';

/*void main() => runApp(MyApp());*/

void main() {
  // request
  // 自定义 jsonDecodeCallback
  (request.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  // 添加拦截器
  request.interceptors.add(LogInterceptor());

  runApp(MyApp());

  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // 主色，决定导航栏颜色
        primaryColor: Colors.grey[50],
        // 主题颜色样本
        scaffoldBackgroundColor: Colors.grey[50],
        dialogBackgroundColor: Colors.grey[50],
        primaryColorBrightness: Brightness.light,
        buttonColor: Colors.blue,
        iconTheme: new IconThemeData(
          color: Colors.grey[700],
        ),
        hintColor: Colors.grey[400],
        appBarTheme: AppBarTheme(
          elevation: 0.5,
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 1.0,
        ),
        /*accentColor: Colors.grey[50], //次级色，决定大多数Widget的颜色，如进度条、开关等
          backgroundColor: Color(0xFFFFFFFF),*/
      ),
      home: MainNavigation(),
      onGenerateRoute: null,
    );
  }
}
