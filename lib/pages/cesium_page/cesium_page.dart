import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
  }

  _launchURL() async {
    var url = 'https://liuvigongzuoshi.github.io/cesium-react';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight =
        MediaQueryData
            .fromWindow(WidgetsBinding.instance.window)
            .padding
            .top;
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Cesium Demo"),
//        actions: <Widget>[
//          IconButton(icon: Icon(CupertinoIcons.share_up), onPressed: _launchURL),
//        ],
//      ),
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight),
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (String url) =>
          {
          setState(() {
            hasLoaded = true;
          })
          },
        ),
      ),
    );
//    return WebviewScaffold(
//      appBar: AppBar(
//        title: Text("Cesium Demo"),
//        actions: <Widget>[
//          IconButton(icon: Icon(CupertinoIcons.share), onPressed: null),
//        ],
//      ),
//      url: url,
//      withLocalStorage: true,
//      withJavascript: true,
//      withZoom: false,
//      hidden: true,
//      supportMultipleWindows: true,
//      allowFileURLs: true,
//      geolocationEnabled: true,
//    );
  }
}
