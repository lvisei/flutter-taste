import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CesiumPage extends StatefulWidget {
  const CesiumPage({Key key}) : super(key: key);

  @override
  _CesiumPageState createState() => new _CesiumPageState();
}

class _CesiumPageState extends State<CesiumPage> {
  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  var url = 'https://liuvigongzuoshi.github.io/cesium-react';
  var url2 = 'https://threejs.org/examples/#webgl_geometry_minecraft_ao';

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onStateChanged.listen((state) {
      print("------------------");
      print(state);
      print("------------------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      withLocalStorage: true,
      withJavascript: true,
      withZoom: false,
      hidden: false,
      supportMultipleWindows: true,
      allowFileURLs: true,
      geolocationEnabled: true,
      initialChild: Container(
        child: const Center(
          child: Text('Waiting.....'),
        ),
      ),
    );
  }
}
