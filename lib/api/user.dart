import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/struct/user_list.dart';
import 'package:flutter_demo/utils/request.dart';

/// 获取用户接口
class ApiUserList {
  /// 获取用户列表接口
  static Future<UserList> getUserList() async {
    // Response<ResponseDataJson<Map<String, dynamic>>> response = await request.get("/view/list");
    Response<Map> response = await request.get("/view/list");
    final responseJson = response.data;
    Map<String, dynamic> responseData = responseJson["data"];
    // UserList parseUserList(Map<String, dynamic> responseData) => UserList.fromJson(responseData);
    // final userList = await compute(parseUserList, responseData);
    // print(userList);
    final userList = UserList.fromJson(responseData);

    return userList;
  }

  /// 获取用户列表接口
  static Future<UserList> getUserListX() async {
    Response response = await request.get("/view/list");
    final responseJson = response.data;
    Map<String, dynamic> responseData = responseJson["data"];
    List<UserListItem> parseUserListItem(Map<String, dynamic> responseData) {
      final parsed = responseData['userList'].cast<Map<String, dynamic>>();
      return parsed.map<UserListItem>((json) => UserListItem.fromJson(json)).toList();
    }

    final userList = await compute(parseUserListItem, responseData);

    return UserList(userList);
  }
}
