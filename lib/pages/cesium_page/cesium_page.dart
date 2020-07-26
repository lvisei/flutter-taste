import 'dart:io';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/utils/screen_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CesiumPage extends StatefulWidget {
  const CesiumPage({Key key}) : super(key: key);

  @override
  _CesiumPageState createState() => new _CesiumPageState();
}

class _CesiumPageState extends State<CesiumPage> {
  String url = 'https://liuvigongzuoshi.gitee.io/cesium-react';
  String url1 = 'https://threejs.org/examples/#webgl_geometry_minecraft_ao';
  String url2 = 'http://ywbang.top/';
  final Completer<bool> pageLoaded = Completer<bool>();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

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
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageFinished: (String url) {
                pageLoaded.complete(true);
              },
            ),
            Container(
              child: FutureBuilder<bool>(
                future: pageLoaded.future,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  final bool pageLoaded = snapshot.data == true;
                  return pageLoaded
                      ? Container()
                      : Center(
                          child: SpinKitThreeBounce(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
