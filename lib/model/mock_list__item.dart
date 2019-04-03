class MockListItem {
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

  MockListItem(
      this.id,
      this.username,
      this.name,
      this.department,
      this.starttime,
      this.state,
      this.sex,
      this.age,
      this.email,
      this.areaname,
      this.areacode);

  MockListItem.fromJson(Map<String, dynamic> json)
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
