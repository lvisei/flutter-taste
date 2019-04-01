import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(primaryColor: Color(0xFFEFEFEF)),
        child: Drawer(
            child: Column(children: <Widget>[
          DrawerHeader(
              child: UserAccountsDrawerHeader(
            accountName: Text("LiusfsfsDah"),
            accountEmail: Text('LiusfsfsDah@foxmial.com'),
            currentAccountPicture: ClipOval(
              child: Image(
                  image: AssetImage("assets/images/avatar.png"), width: 60.0),
            ),
          )),
          ListTile(
            leading: const Icon(Icons.event_seat),
            title: const Text('The seat for the narrator'),
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
