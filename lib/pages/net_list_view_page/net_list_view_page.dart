import 'package:flutter/material.dart';
import 'package:flutter_demo/api/user.dart';
import 'package:flutter_demo/struct/user_list.dart';

class NetListViewPage extends StatefulWidget {
  @override
  _NetListViewPageState createState() => _NetListViewPageState();
}

class _NetListViewPageState extends State<NetListViewPage> {
  List _userListData = new List();
  final _saved = new Set<UserListItem>();
  ScrollController _scrollController = new ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getMoreData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  Future<List<UserListItem>> _getMockListData() async {
    List<UserListItem> userList;

    try {
      UserList userListData = await ApiUserList.getUserList();
      userList = userListData.userList;
    } catch (e) {}
    return userList;
  }

  Future _getMoreData() async {
    if (!isLoading) {
      // 如果上一次异步请求数据完成 同时有数据可以加载
      if (mounted) {
        setState(() => isLoading = true);
      }
      List newUserList = (await _getMockListData());
      if (mounted) {
        setState(() {
          _userListData.addAll(newUserList);
          isLoading = false;
        });
      }
    }
  }

  Future<void> _onRefresh() async {
    List newUserList = (await _getMockListData());
    if (mounted) {
      setState(() {
        _userListData.clear();
        _userListData.addAll(newUserList);
        isLoading = false;
      });
      return null;
    }
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (user) {
              return new ListTile(
                title: new Text(
                  user.name,
                  style: TextStyle(fontSize: 18.0),
                ),
                trailing: Text(
                  user.email,
                  style: TextStyle(color: Colors.black54, fontSize: 10.0),
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('已保存用户'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildProgressIndicator() {
    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            children: <Widget>[
              new Opacity(
                opacity: isLoading ? 1.0 : 0.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '数据疯狂加载中...',
                style: TextStyle(fontSize: 14.0),
              )
            ],
          ),
        ),
      );
    } else {
      return Container(height: 40.0);
    }
  }

  Widget _buildUserList() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: _userListData.length + 1,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index == _userListData.length) {
            return _buildProgressIndicator();
          } else {
            return _buildUserItem(_userListData[index]);
          }
        },
        controller: _scrollController,
      ),
    );
  }

  Widget _buildUserItem(UserListItem user) {
    final alreadySaved = _saved.contains(user);
    return Card(
      color: Colors.white,
      elevation: 0.8,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: ListTile(
        onTap: () {
          setState(() {
            alreadySaved ? _saved.remove(user) : _saved.add(user);
          });
        },
        title: Padding(
          child: Text(
            user.name,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          padding: EdgeInsets.only(top: 10.0),
        ),
        subtitle: Row(
          children: <Widget>[
            Padding(
              child: Text(
                user.email,
                style: TextStyle(color: Colors.black54, fontSize: 10.0),
              ),
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            )
          ],
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _buildUserList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushSaved,
        tooltip: 'Saved Suggestions',
        child: Icon(Icons.list),
      ),
    );
  }
}
