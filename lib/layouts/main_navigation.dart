import 'package:flutter/material.dart';
import 'package:flutter_demo_app/pages/cesium_page/cesium_page.dart';
import 'package:flutter_demo_app/pages/home_page/home_page.dart';
import 'package:flutter_demo_app/pages/map_page/map_page.dart';

class MainNavigation extends StatefulWidget {
  MainNavigation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainNavigationState createState() => new _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 1;
  var __currentPage;
  final List<BottomNavigationBarItem> bottomNavigationItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('地图')),
    BottomNavigationBarItem(icon: Icon(Icons.trip_origin), title: Text('三维'))
  ];
  final List tabBodies = [new HomePage(), new MapPage(), new CesiumPage()];

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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: bottomNavigationItems,
          onTap: _onNavigationBarItemTapped),
      body: __currentPage,
    );
  }
}
