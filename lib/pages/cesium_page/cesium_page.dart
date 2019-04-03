import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CesiumPage extends StatefulWidget {
  const CesiumPage({Key key}) : super(key: key);

  @override
  _CesiumPageState createState() => new _CesiumPageState();
}

class _CesiumPageState extends State<CesiumPage> {
  String url = 'https://liuvigongzuoshi.github.io/cesium-react';
  String url2 = 'https://threejs.org/examples/#webgl_geometry_minecraft_ao';
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeRight,
    ]);
  }

  _launchURL() async {
    var url = 'https://github.com/liuvigongzuoshi/flutter-demo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cesium Demo"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: _launchURL),
        ],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String url) =>
        {
        setState(() {
          hasLoaded = true;
        })
        },
      ),
    );
//    return WebviewScaffold(
//      appBar: AppBar(
//        title: Text("Cesium Demo"),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.share), onPressed: null),
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
