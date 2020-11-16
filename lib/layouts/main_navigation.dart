import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/cesium_page/cesium_page.dart';
import 'package:flutter_demo/pages/home_page/home_page.dart';
import 'package:flutter_demo/pages/map_page/map_page.dart';
import 'package:flutter_demo/pages/about_page/about_page.dart';

class MainNavigation extends StatefulWidget {
  MainNavigation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainNavigationState createState() => new _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  var __currentPage;
  var _lastClickExitTime;

  final List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    BottomNavigationBarItem(icon: Icon(Icons.map), label: '地图'),
    BottomNavigationBarItem(icon: Icon(Icons.trip_origin), label: '三维'),
    BottomNavigationBarItem(icon: Icon(Icons.face), label: '关于'),
  ];
  final List tabBodies = [new HomePage(), new MapPage(), new CesiumPage(), new AboutPage()];

  @override
  void initState() {
    super.initState();
    __currentPage = tabBodies[_currentIndex];
  }

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      __currentPage = tabBodies[_currentIndex];
    });
  }

  Future<bool> _onWillPop() async {
    if (_lastClickExitTime == null || DateTime.now().difference(_lastClickExitTime) > Duration(milliseconds: 1500)) {
      _lastClickExitTime = DateTime.now();
      return false;
    } else {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('退出App'),
            content: Text('确定不是手滑？'),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '取消',
                ),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text(
                  '退出',
                ),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: new Scaffold(
        backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
        bottomNavigationBar: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.blue,
            currentIndex: _currentIndex,
            items: bottomNavigationItems,
            onTap: _onNavigationBarItemTapped),
        body: __currentPage,
      ),
      onWillPop: _onWillPop,
    );
  }
}
