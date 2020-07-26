import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage({@required this.url, this.title});

  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<bool> pageStarted = Completer<bool>();
  final Completer<bool> pageLoaded = Completer<bool>();
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Future<Null> _onRefresh(BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("刷新中"),
      duration: new Duration(seconds: 1),
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
    ));
    await _controller.future.then((_controller) => _controller.reload());
  }

  Widget reloadButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          final bool webViewReady =
              snapshot.connectionState == ConnectionState.done;
          final WebViewController controller = snapshot.data;
          return IconButton(
            icon: Icon(CupertinoIcons.refresh),
            onPressed: webViewReady ? () => _onRefresh(context) : null,
          );
        });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(CupertinoIcons.refresh_thin),
              onPressed: () => _onRefresh(context),
            );
          }),
          IconButton(
            icon: Icon(CupertinoIcons.share_up),
            onPressed: () => _launchURL(widget.url),
          ),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: <Widget>[
            WebView(
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onPageStarted: (String url) {
                pageStarted.complete(true);
              },
              onPageFinished: (String url) {
                pageLoaded.complete(true);
              },
            ),
            Container(
              child: FutureBuilder<bool>(
                future: pageStarted.future,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  final bool pageStarted = snapshot.data == true;
                  return pageStarted
                      ? Container()
                      : Center(
                          child: SpinKitCircle(
                            color: Colors.blue,
                            size: 50.0,
                          ),
                        );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  TextEditingController controller = TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString = "https://liuvigongzuoshi.github.io/cesium-react/index.html";

  launchUrl() {
    setState(() {
      urlString = controller.text;
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: false,
          controller: controller,
          textInputAction: TextInputAction.go,
          onSubmitted: (url) => launchUrl(),
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Enter Url Here",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: launchUrl,
          )
        ],
      ),
      url: urlString,
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
      supportMultipleWindows: true,
      allowFileURLs: true,
      geolocationEnabled: true,
      initialChild: SpinKitDoubleBounce(
        color: Colors.blue,
        size: 50.0,
      ),
    );
  }
}
