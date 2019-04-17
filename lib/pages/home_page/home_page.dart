import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:flutter_demo_app/pages/test_pege/test_pege.dart';
import 'package:flutter_demo_app/pages/list_view_page/list_view_page.dart';
import 'package:flutter_demo_app/layouts/my_drawer.dart';
import 'package:flutter_demo_app/pages/custom_paint_page/custom_paint_page.dart';
import 'package:flutter_demo_app/pages/net_list_view_page/net_list_view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  String _title = '首页';
  TabController _tabController;
  List tabs = ["列表", "网络", "绘制", "测试"];
  String url = 'https://github.com/liuvigongzuoshi/flutter-demo';

  _shareURL(String url) {
    Share.share(url);
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
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(CupertinoIcons.share),
              onPressed: () => _shareURL(url)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((text) => Tab(text: text)).toList(),
        ),
      ),
      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListViewPage(),
          NetListViewPage(),
          CustomPaintPage(),
          TestPage()
        ],
      ),
    );
  }
}
