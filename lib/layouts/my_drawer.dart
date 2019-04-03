import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.grey[50]),
        child: Drawer(
            child: Column(children: <Widget>[
          DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text("liuvigongzuoshi"),
                accountEmail: Text('liuvigongzuoshi@foxmial.com'),
            currentAccountPicture: ClipOval(
              child: Image(
                  image: AssetImage("assets/images/avatar.png"), width: 40.0),
            ),
          )),
          ListTile(
            leading: const Icon(Icons.child_care),
            title: const Text('liuvigongzuoshi'),
          ),
          ListTile(
            leading: const Icon(Icons.alternate_email),
            title: const Text('liuvigongzuoshi@foxmial.com'),
          ),
        ])));

//    return Drawer(
//      child: MediaQuery.removePadding(
//        context: context,
//        removeTop: true,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.only(top: 38.0),
//              child: Row(
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                    child: ClipOval(
//                      child: Image(
//                          image: AssetImage("assets/images/avatar.png"),
//                          width: 60.0),
//                    ),
//                  ),
//                  Text(
//                    "AAAAAAAAAAA",
//                    style: TextStyle(fontWeight: FontWeight.bold),
//                  )
//                ],
//              ),
//            ),
//            Expanded(
//              child: ListView(
//                children: <Widget>[
//                  ListTile(
//                    leading: const Icon(Icons.add),
//                    title: const Text('Add account'),
//                  ),
//                  ListTile(
//                    leading: const Icon(Icons.settings),
//                    title: const Text('Manage accounts'),
//                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
  }
}
