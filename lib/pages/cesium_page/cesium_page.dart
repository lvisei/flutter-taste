import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/utils/screen_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CesiumPage extends StatefulWidget {
  const CesiumPage({Key key}) : super(key: key);

  @override
  _CesiumPageState createState() => new _CesiumPageState();
}

class _CesiumPageState extends State<CesiumPage> {
  String url = 'https://liuvigongzuoshi.gitee.io/cesium-react';
  String url1 = 'https://threejs.org/examples/#webgl_geometry_minecraft_ao';
  String url2 = 'http://ywbang.top/';
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();

    /*if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.black);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      ScreenUtils.updateStatusBarStyle(SystemUiOverlayStyle.light);
    }*/
  }

  @override
  void dispose() {
    super.dispose();
    /*if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight =
        MediaQueryData
            .fromWindow(WidgetsBinding.instance.window)
            .padding
            .top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: WebviewScaffold(
          url: url,
          withLocalStorage: true,
          withJavascript: true,
          withZoom: false,
          hidden: true,
          supportMultipleWindows: true,
          allowFileURLs: true,
          geolocationEnabled: true,
          initialChild: SpinKitRipple(
            color: Colors.blue,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
