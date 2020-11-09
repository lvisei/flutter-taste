# flutter-demo
A initial taste of the Flutter project

## Getting Started

## Clone Project

```bash
git clone https://github.com/liuvigongzuoshi/flutter-demo.git
```

### Flutter Install

https://flutter.cn/docs/get-started/install

### Run Project

```bash
# Android
flutter run apk

# iOS
flutter run ios
```

## Preview

![preview](./preview.gif)

## App 用到的 Packages

packages name | Features
---|---
shared_preferences | 持久化存储数据
url_launcher | 打开第三方应用
flutter_map | 基于 Leaflet 地图库
dio | 网络请求库
webview_flutter | official webview
flutter_inappwebview | inline webview
amap_location_fluttify | 高德定位插件
share | 系统分享插件
cached_network_image | 图片加载缓存（sqflite）
fluttertoast | toast 消息
flutter_svg | 使用svg图标插件
permission_handler | 权限辅助插件
photo_view	| 图片预览
sqflite | 数据库
connectivity | 网络链接状态判断
flutter_spinkit | 加载指示器库

## App 用到的权限

### 网络权限

- Android
	- android.permission.INTERNET
- iOS
    - _

### 定位

使用时候定位与后台定位

- Android
    - ACCESS_FINE_LOCATION
    - ACCESS_COARSE_LOCATION
    - ACCESS_BACKGROUND_LOCATION
- iOS
    - NSLocationWhenInUseUsageDescription
    - NSLocationAlwaysUsageDescription


## APP 适配最低型号

- iOS 10.3
- Android SDK 23 (Marshmallow 6.0)