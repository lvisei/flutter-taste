// {
//   "success": true,
//   "code": 200,
//   "data": {
//     "userList": [
//       {
//         "id": "350000197406122406",
//         "username": "高",
//         "name": "白敏",
//         "department": "华北",
//         "starttime": "1989-06-25 20:11:23",
//         "state": 0,
//         "sex": 2,
//         "age": 36,
//         "email": "n.fusvfth@pclv.py",
//         "areaname": "杭州",
//         "areacode": ["hangzhou"]
//       },
//     ]
//   },
//   "message": "请求成功"
// }

class UserList {
  final List<UserListItem> userList;

  UserList(this.userList);

  UserList.fromJson(Map<String, dynamic> json)
      : userList = json['userList']
            .cast<Map<String, dynamic>>()
            .map<UserListItem>((json) => UserListItem.fromJson(json))
            .toList();

  Map<String, dynamic> toJson() => {'userList': userList};
}

class UserListItem {
  final String id;
  final String username;
  final String name;
  final String department;
  final String starttime;
  final int state;
  final int sex;
  final int age;
  final String email;
  final String areaname;
  final List areacode;

  UserListItem(this.id, this.username, this.name, this.department, this.starttime, this.state, this.sex, this.age,
      this.email, this.areaname, this.areacode);

  UserListItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        name = json['name'],
        department = json['department'],
        starttime = json['starttime'],
        state = json['state'],
        sex = json['sex'],
        age = json['age'],
        email = json['email'],
        areaname = json['areaname'],
        areacode = json['areacode'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'department': department,
        'starttime': starttime,
        'state': state,
        'sex': sex,
        'age': age,
        'email': email,
        'areaname': areaname,
        'areacode': areacode
      };
}
