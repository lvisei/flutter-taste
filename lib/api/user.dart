import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_demo/struct/user_list.dart';
import 'package:flutter_demo/utils/request.dart';

/// 获取用户接口
class ApiUserList {
  /// 获取用户列表接口
  static Future<UserList> getUserList() async {
    Response<ResponseDataJson> response = await request.get<ResponseDataJson>("/view/list");
    final responseJson = response.data;
    final responseData = responseJson.data;
    print("-------------------------------------");
    // UserList parseUserList(Map<String, dynamic> responseData) =>
    //     UserList.fromJson(responseData);
    // final userList = compute(parseUserList, responseData);
    final userList = UserList.fromJson(responseData);

    return userList;
  }

  /// 获取用户列表接口
  static Future<List<UserListItem>> getUserListX() async {
    Response<ResponseDataJson> response = await request.get<ResponseDataJson>("/view/list");
    final responseJson = response.data;
    final responseData = responseJson.data;
    List<UserListItem> parseUserListItem(Map<String, dynamic> responseData) {
      final parsed = responseData['userList'].cast<Map<String, dynamic>>();
      return parsed.map<UserListItem>((json) => UserListItem.fromJson(json)).toList();
    }

    final userList = compute(parseUserListItem, responseData);

    return userList;
  }
}
