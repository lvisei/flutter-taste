import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_demo_app/pages/test_pege/test_pege.dart';
import 'package:flutter_demo_app/pages/list_view_page/list_view_page.dart';
import 'package:flutter_demo_app/layouts/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String _title = 'Home Page';
  TabController _tabController;
  List tabs = ["列表", "测试"];

  _launchURL() async {
    var url = 'https://liuvigongzuoshi.github.io/cesium-react/index.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: _launchURL),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((text) => Tab(text: text)).toList(),
        ),
      ),
      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[ListViewPage(), TestPage()],
      ),
    );
  }
}
