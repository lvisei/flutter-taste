import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' show ImageFilter;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_demo/pages/web_view_page/web_view_page.dart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:photo_view/photo_view.dart';

import 'package:flutter_demo/shared/constants.dart';
import 'package:flutter_demo/utils/device_screen.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String avatarUrl = AvatarUrl.avatarUrl;
  String avatarBgUrl = AvatarUrl.avatarBgUrl03;

  @override
  Widget build(BuildContext context) {
    DeviceScreen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
          color: Color(0xFFFFFFFF),
          height: DeviceScreen.height,
          width: DeviceScreen.width,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              _buildHeader(),
              _buildItem(
                'assets/svg/mark-github.svg',
                Colors.black,
                '项目地址',
                _openGithub,
              ),
              _buildItem(
                'assets/svg/octoface.svg',
                Colors.black,
                'React Resium 🌏',
                _openCesium,
              ),
              _buildItem(
                'assets/svg/juejin.svg',
                Colors.blue,
                '掘金社区',
                _openJuejin,
              ),
              _buildItem(
                'assets/svg/mail.svg',
                Colors.blueGrey,
                '邮箱',
                _copyMyEmail,
              ),
            ],
          )),
    );
  }

  _openGithub() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => WebViewPage(
          url: 'https://github.com/liuvigongzuoshi/flutter-demo',
          title: 'About Demo',
        ),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  _openCesium() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => WebViewPage(
          url: 'https://github.com/liuvigongzuoshi/cesium-react',
          title: 'cesium-react',
        ),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  _openJuejin() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => WebViewPage(
          url: 'https://juejin.im/tag/Flutter',
          title: 'Juejin Flutter',
        ),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  _copyMyEmail() {
    Clipboard.setData(ClipboardData(text: 'liuvigongzuoshi@foxmail.com'));
    Fluttertoast.showToast(msg: '已复制邮箱地址');
  }

  _handPreviewImg(ImageProvider imageProvider) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) => Container(
            child: PhotoView(
          imageProvider: imageProvider,
        )),
        transitionDuration: const Duration(milliseconds: 100),
      ),
    );
  }

  Widget _buildItem(String icon, Color color, String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: DeviceScreen.width,
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
                SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: SvgPicture.asset(
                    icon,
                    color: color,
                  ),
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
            Icon(CupertinoIcons.forward)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    double width = DeviceScreen.width;
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
              width: DeviceScreen.width,
              height: height,
            ),
          ),
          GestureDetector(
            onTap: () => _handPreviewImg(CachedNetworkImageProvider(avatarBgUrl)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(
                width: DeviceScreen.width,
                height: height,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => _handPreviewImg(CachedNetworkImageProvider(avatarUrl)),
                      child: CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(avatarUrl),
                        radius: 50.0,
                      ),
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
          ),
        ],
      ),
    );
  }
}
