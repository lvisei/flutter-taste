import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' show ImageFilter;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo_app/pages/web_view_page/web_view_page.dart.dart';

import 'package:flutter_demo_app/shared/constants.dart';
import 'package:flutter_demo_app/utils/screen_utils.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String avatarUrl = ServerUrl.avatarUrl;
  String avatarBgUrl = ServerUrl.avatarBgUrl02;

  @override
  Widget build(BuildContext context) {
    ScreenUtils.updateStatusBarStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
          color: Color(0xFFFFFFFF),
          height: ScreenUtils.height,
          width: ScreenUtils.width,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              _buildHeader(),
              _buildItem('assets/svg/mark-github.svg', '项目地址', _openGithub),
              _buildItem('assets/svg/octoface.svg', 'React Resium 🌏',
                  _openCesium),
              _buildItem('assets/svg/juejin.svg', '掘金社区', _openJuejin),
              _buildItem('assets/svg/mail.svg', '邮箱', _copyMyEmail),
            ],
          )),
    );
  }

  _openGithub() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            WebViewPage(
              url: 'https://github.com/liuvigongzuoshi/flutter-demo',
              title: 'About Demo',
            ),
      ),
    );
  }

  _openJuejin() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            WebViewPage(
              url: 'https://github.com/liuvigongzuoshi/cesium-react',
              title: 'cesium-react',
            ),
      ),
    );
  }

  _openCesium() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            WebViewPage(
              url: 'https://juejin.im/tag/Flutter',
              title: 'Juejin Flutter',
            ),
      ),
    );
  }

  _copyMyEmail() {
    Clipboard.setData(ClipboardData(text: 'liuvigongzuoshi@foxmail.com'));
    Fluttertoast.showToast(msg: '已复制邮箱');
  }

  Widget _buildItem(String icon, String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: ScreenUtils.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFDDDDDD), width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  icon,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    double width = ScreenUtils.width;
    double height = 250;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(avatarBgUrl),
            fit: BoxFit.fitWidth,
            width: width,
            height: height,
          ),
          Opacity(
            opacity: 0,
            child: Container(
              color: Colors.black,
              width: ScreenUtils.width,
              height: height,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              width: ScreenUtils.width,
              height: height,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(avatarUrl),
                    radius: 50.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'liuvigongzuoshi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
