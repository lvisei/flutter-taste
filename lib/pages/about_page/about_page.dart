import 'package:flutter/material.dart';
import 'package:flutter_demo_app/pages/web_view_page/web_view_page.dart.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String url = 'https://github.com/liuvigongzuoshi/flutter-demo';
  String juejing = 'https://juejin.im/timeline';
  String title = 'About Demo';

  @override
  Widget build(BuildContext context) {
    return WebViewPage(url, title);
  }
}
