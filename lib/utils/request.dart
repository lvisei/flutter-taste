import 'dart:convert';

// import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/config/server_url.dart';

class ResponseDataJson {
  bool success;
  int code;
  Map<String, dynamic> data;
  String message;
}

final BaseOptions options = new BaseOptions(
  baseUrl: ServerUrl.Base_URL,
  sendTimeout: 5000,
  headers: {},
  responseType: ResponseType.json,
);

final Dio request = Dio(options);

// 必须是顶层函数
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

main() {
  // 自定义 jsonDecodeCallback
  (request.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
  // 添加拦截器
  request.interceptors.add(LogInterceptor());
  request.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
    // 在请求被发送之前做一些事情
    return options; //continue
    // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }, onResponse: (Response response) async {
    // 在返回响应数据之前做一些预处理
    return response; // continue
  }, onError: (DioError e) async {
    // 当请求失败时做一些预处理
    return e; //continue
  }));
  // (request.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
  //   client.findProxy = (uri) {
  //     //proxy to my PC(charles)
  //     return "PROXY 10.1.10.250:8888";
  //   };
  // };
}
